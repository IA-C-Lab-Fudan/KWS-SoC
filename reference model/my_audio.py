
# coding: utf-8

# In[1]:


import wave
import numpy as np
import math


# ## 读取wav

# In[2]:


def wavread(path):
    wavfile =  wave.open(path,"rb")
    params = wavfile.getparams()
    framesra,frameswav= params[2],params[3]
    datawav = wavfile.readframes(frameswav)
    wavfile.close()
    datause = np.fromstring(datawav,dtype = np.short)
    if len(datause) < 16000:
        pad_len = 16000 - len(datause)
        pad = np.zeros(pad_len)
        datause = np.hstack((datause, pad))
    elif len(datause) > 16000:
        prune_len = len(datause) - 16000
        datause, prune = np.hsplit(datause, (16000,))
        
    #time = np.arange(0, frameswav) * (1.0/framesra)
    datause = datause/32768  #2**15
    return datause


# ## 短时傅里叶变换

# In[3]:


def calc_stft(signal, sample_rate=16000, window_size_samples=640, window_stride_samples=320, winfunc=np.hanning, NFFT=1024):
    frame_length = window_size_samples
    frame_step = window_stride_samples
    signal_length = len(signal)
    frame_length = int(round(frame_length))
    frame_step = int(round(frame_step))
    num_frames = 1 + int(np.ceil(float(np.abs(signal_length - frame_length)) / frame_step))
    # zero padding
    pad_signal_length = num_frames * frame_step + frame_length
    z = np.zeros((pad_signal_length - signal_length))
    # Pad signal to make sure that all frames have equal number of samples 
    # without truncating any samples from the original signal
    pad_signal = np.append(signal, z)

    # Slice the signal into frames from indices
    indices = np.tile(np.arange(0, frame_length), (num_frames, 1)) + np.tile(np.arange(0, num_frames * frame_step, frame_step), (frame_length, 1)).T
    frames = pad_signal[indices.astype(np.int32, copy=False)]
    # Get windowed frames
    frames *= winfunc(frame_length)
    # Compute the one-dimensional n-point discrete Fourier Transform(DFT) of
    # a real-valued array by means of an efficient algorithm called Fast Fourier Transform (FFT)
    mag_frames = np.absolute(np.fft.rfft(frames, NFFT))
    # Compute power spectrum
    #pow_frames = (1.0 / NFFT) * ((mag_frames) ** 2)
    spectrogram = np.square(mag_frames)

    return spectrogram


# ## 转换梅尔倒频谱

# In[4]:


def FreqToMel(hz):
    return 2595 * np.log10(1 + hz / 700.0)


# In[5]:


def fbank(spec_input, sample_rate=16000, input_length=513, num_channels=40, lower_frequency_limit=20, upper_frequency_limit=4000):
    mel_low = FreqToMel(lower_frequency_limit)  #最小mel点
    mel_hi = FreqToMel(upper_frequency_limit)   #最大mel点
    mel_span = mel_hi - mel_low
    mel_spacing = mel_span / (num_channels + 1)  #等差数列
    center_frequencies = np.zeros((num_channels+1))
    for i in range(num_channels+1):
        center_frequencies[i] = mel_low + (mel_spacing*(i+1))
        
    hz_per_sbin = 0.5 * sample_rate / (input_length - 1)
    start_index = int(1.5 + (lower_frequency_limit / hz_per_sbin))
    end_index = int(upper_frequency_limit / hz_per_sbin)
    
    band_mapper = np.zeros((input_length))
    channel = 0
    for i in range(input_length):
        melf = FreqToMel(i * hz_per_sbin)
        if (i < start_index or i > end_index):
            band_mapper[i] = -2
        else:
            while((center_frequencies[channel] < melf) & (channel < num_channels)):
                channel += 1
            band_mapper[i] = channel - 1
            
    weights = np.zeros((input_length))
    for i in range(input_length):
        channel = band_mapper[i]
        if (i < start_index or i > end_index):
            weights[i] = 0.0
        else:
            if channel >= 0:
                channel = int(channel)
                weights[i] = (center_frequencies[channel+1] - FreqToMel(i*hz_per_sbin)) / (center_frequencies[channel+1] - center_frequencies[channel])
            else:
                weights[i] = (center_frequencies[0] -FreqToMel(i*hz_per_sbin))/(center_frequencies[0] - mel_low)
                
    bad_channels = np.zeros((num_channels, input_length))
    for c in range(num_channels):
        band_weights_sum = 0.0
        bad_channel_index = 0
        for i in range(input_length):
            if band_mapper[i] == c-1:
                band_weights_sum += (1.0 - weights[i])
            elif band_mapper[i] == c :
                band_weights_sum += weights[i]
    
        if band_weights_sum < 0.5:
            bad_channels[c][bad_channel_index] = c
            bad_channel_index += 1
            
    output = np.zeros((len(spec_input), num_channels))
    for i in range(len(spec_input)):
        for j in range(start_index, end_index):
            spec_val = math.sqrt(spec_input[i][j])
            weighted = spec_val * weights[j]
            channel = int(band_mapper[j])
            if channel >= 0:
                output[i][channel] += weighted
            channel += 1
            if channel < num_channels:
                output[i][channel] += spec_val - weighted
    return output


# In[6]:


def mfcc_log(fbank_out, kFilterbankFloor = 1e-12):
    time_step = len(fbank_out)
    input_channel = len(fbank_out[0])
    
    kFilterbankFloor = 1e-12
    working = np.zeros((time_step, input_channel))
    for i in range(time_step):
        for j in range(input_channel):
            val = fbank_out[i][j]
            if val < kFilterbankFloor:
                val = kFilterbankFloor
            working[i][j] = math.log(val)
            
    return working


# In[7]:


def mfcc_dct(working, input_length=40, coefficient_count=10):
    dct_input = working
    #coefficient_count = 10
    time_step = len(working)
    #input_length = len(working[0]) # fbank中的num_channels 40
    length = len(working[0])   # 40
    if length > input_length:
        length = input_length
    
    cosines_ = np.zeros((coefficient_count, input_length))
    fnorm = math.sqrt(2.0/input_length)
    pi = 3.1415926
    arg = pi / input_length

    for i in range(coefficient_count):
        for j in range(input_length):
            cosines_[i][j] = fnorm * math.cos(i * arg * (j + 0.5))

    dct_out = np.zeros((time_step, coefficient_count))

    for i in range(time_step):
        for j in range(coefficient_count):
            dct_sum = 0.0
            for k in range(length):
                dct_sum += cosines_[j][k] * dct_input[i][k]
            dct_out[i][j] = dct_sum
            #print(i, ' ', j , ' dct_sum: ', dct_sum)
    
    return dct_out


# In[8]:


def my_spectrogram(in_path, sample_rate=16000, window_size_samples=640, 
              window_stride_samples=320, winfunc=np.hanning, NFFT=1024):
    
    datause = wavread(in_path)
    spectrogram = calc_stft(datause, sample_rate=sample_rate, window_size_samples=window_size_samples, 
              window_stride_samples=window_stride_samples, winfunc=winfunc, NFFT=NFFT)
    
    return spectrogram


# In[9]:


def my_mfcc(spec_input, sample_rate=16000, num_channels=40, lower_frequency_limit=20, upper_frequency_limit=4000):
    input_length = len(spec_input[-1])
    fbank_out = fbank(spec_input, sample_rate=sample_rate, input_length=input_length, 
            num_channels=num_channels, lower_frequency_limit=lower_frequency_limit, upper_frequency_limit=upper_frequency_limit)
    working = mfcc_log(fbank_out)
    dct_out = mfcc_dct(working)
    
    return dct_out


# In[10]:


spectrogram = my_spectrogram('./wav/test1.wav')
print(spectrogram)
print(type(spectrogram))
dct_out = my_mfcc(spectrogram)


# In[11]:


print(dct_out)


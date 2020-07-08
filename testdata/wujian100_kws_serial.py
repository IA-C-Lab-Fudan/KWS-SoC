import serial,threading,time
import wave
import numpy as np
import struct
import binascii

ser=serial.Serial('com5',115200,timeout=1)

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

    np.savetxt('test1.txt',datause,fmt='%0.15f')
    return datause


def Receiving():  # 接收函数
     while True: # 循环接收数据
         if ser.in_waiting:  # 当接收缓冲区中的数据不为零时，执行下面的代码
            str=ser.read(ser.in_waiting).decode("gbk")
            print(str,end='')



if __name__ == "__main__":

    print("Start loading data...")
    time_start = time.time()
    m=[]
    output=[]

    datause = wavread('./test1.wav')
    for i in datause:
        m.append(struct.pack('>f', i).hex()) 
    

    for i in range(0,40):
        tmp = "".join(m[i*400:(i+1)*400])
        tmp = binascii.unhexlify(tmp)
        output.append(tmp)

    t1 = threading.Thread(target=Receiving)
    t1.start()

    time_middle = time.time()

    for i in range(0,40):
        ser.write(output[i])
        time.sleep(0.015) 
    time_stop = time.time()

    print("Finish loading data...")
    print("Data loads run for {:.5f}s".format(time_stop-time_start))

    a=0
    while a<2:
        a=0


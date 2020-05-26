
# coding: utf-8

# In[1]:


import Ipynb_importer
import tensorflow as tf
import os
import numpy as np
from tensorflow.python import pywrap_tensorflow

#import get_mfcc
import my_audio


# In[2]:


#配置显存按需占用
os.environ["CUDA_VISIBLE_DEVICES"] = "1"
config = tf.ConfigProto()
config.gpu_options.per_process_gpu_memory_fraction = 0.5
config.gpu_options.allow_growth = True


# ### GRU测试记录

# In[3]:


#TIME_SIZE = 43
#卷积中
#Frequency_SZIE = 8
#conv_output_channel = 48
#第一层
#INPUT_DIM1 = Frequency_SIZE * conv_output_channel = 384
#HIDDEN_DIM1 = 40
#gates/kernel_shape1 = [INPUT_DIM + HIDDEN_DIM, 2*HIDDEN_DIM] = [424, 80]
#candidate/kernel_shape1 = [INPUT_DIM + HIDDEN_DIM, HIDDEN_DIM] = [424, 40]
'''
print(var_to_shape_map['rnn/multi_rnn_cell/cell_0/gru_cell/gates/kernel'])
print(var_to_shape_map['rnn/multi_rnn_cell/cell_0/gru_cell/candidate/kernel'])
'''


# ### 记录参数在checkpoint的name

# In[4]:


checkpoint_path = os.path.join("./checkpoint/ds_rnn_9360.ckpt-17200")
reader = pywrap_tensorflow.NewCheckpointReader(checkpoint_path)
var_to_shape_map = reader.get_variable_to_shape_map()

DW = ['DW1', 'DW2']
PW = ['PW1', 'PW2']
beta = ['beta0', 'beta1']
gamma = ['gamma0', 'gamma1']
mean = ['mean0', 'mean1']
variance = ['variance0', 'variance1']
gates_w = ['rnn/gru1/gates/kernel']
gates_b = ['rnn/gru1/gates/bias']
candidate_w = ['rnn/gru1/candidate/kernel']
candidate_b = ['rnn/gru1/candidate/bias']
fcw = ['fcw', 'Variable_1']
fcb = ['Variable', 'Variable_2']


# In[5]:


weight_name = []
batch_name = []
grucell_name = gates_w + gates_b + candidate_w + candidate_b
print(grucell_name)
for i in range(2):
    #按顺序记录weight参数的name，用来后续提出参数
    weight_name.append(DW[i])
    weight_name.append(PW[i])
    
    #按顺序记录batch参数的name
    batch_name.append(beta[i])
    batch_name.append(gamma[i])
    batch_name.append(mean[i])
    batch_name.append(variance[i])
for i in range(2):
    #记录全连接的name
    weight_name.append(fcw[i])
    weight_name.append(fcb[i])


# ### 整理batch参数

# In[6]:


batch_value = {}

for name in batch_name:
    #通过name读取权重参数
    #print(name)
    batches = np.array(reader.get_tensor(name))
    batches_flatten = batches.flatten()
    #print(np.shape(batches))
    batch_value[name] = batches
    
    #batch_index += 1

batch_scale = {}
batch_scale['scale0'] = batch_value['gamma0']/ (batch_value['variance0'] + 0.001)
batch_scale['scale1'] = batch_value['gamma1']/ (batch_value['variance1'] + 0.001)
batch_scale['bias0'] = batch_value['beta0'] - batch_scale['scale0']*batch_value['mean0']
batch_scale['bias1'] = batch_value['beta1'] - batch_scale['scale1']*batch_value['mean1']

batch_value = {}
batch_value[0] = batch_scale['bias0']
batch_value[1] = batch_scale['bias1']

'''
for key in batch_scale:
    print(key)
    print(batch_scale[key])
'''


# ### 整理卷积参数

# In[7]:


weights_value = {}
weights_index = 0

for name in weight_name:
    #通过name读取权重参数
    #print(name)
    #f = open('./weights/conv_value/'+name+'.dat', 'w')
    weights = np.array(reader.get_tensor(name))
    
    #print(np.shape(weights))
    if weights_index == 1:
        weights = weights*batch_scale['scale0']
    elif weights_index == 3:
        weights = weights*batch_scale['scale1']
    weights_value[weights_index] = weights
    
    weights_flatten = weights.flatten()
    
    #for i in weights_flatten:
    #    f.write(str(i))
    #    f.write('\n')
    #f.close()

    weights_index += 1
    


# ### 整理RNN参数

# In[8]:


grucell_value = {}
grucell_index = 0

for name in grucell_name:
    grucells = np.array(reader.get_tensor(name))
    grucells_flatten = grucells.flatten()
    
    grucell_value[grucell_index] = grucells
    grucell_index += 1


# ### 网络结构

# In[9]:


class ds_rnn:
    def __init__(self, fingerprint_input, frequency_size, time_size, 
                 weights=None, batch_para=None, gru_para=None, sess=None):
        self.fingerprint_input = fingerprint_input
        self.frequency_size = frequency_size
        self.time_size = time_size
        

        self.conv_layers()
        self.rnn_layers()
        self.fc_layers()
        self.probs = tf.nn.softmax(self.fc2)
        
        if weights is not None and sess is not None and gru_para is not None:
            self.load_weights(weights, batch_para, gru_para, sess)
    
    def conv_layers(self):
        self.parameters = []
        self.batch_parameters = []
        self.conv_output_channel = 48
        self.padding = 'VALID'
        # zero-mean input
        with tf.name_scope('preprocess') as scope:
            fingerprint_4d =tf.reshape(self.fingerprint_input, [-1, self.time_size, self.frequency_size, 1], name='input')

        # conv1
        with tf.name_scope('conv1') as scope: 
            depthwise_filter = tf.Variable(tf.truncated_normal([4, 2, 1, 1], dtype=tf.float32,
                                                               stddev=1e-1), name='dw_weights')
            pointwise_filter = tf.Variable(tf.truncated_normal([1, 1, 1, self.conv_output_channel], dtype=tf.float32,
                                                               stddev=1e-1), name='pw_weights')     
            batch_bias = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='batch_bias')
            #beta = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='beta')
            #gamma = tf.Variable(tf.ones([self.conv_output_channel], dtype=tf.float32), name='gamma')
            #mean = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='mean')
            #variance = tf.Variable(tf.ones([self.conv_output_channel], dtype=tf.float32), name='variance')
            
            self.de_conv1 = tf.nn.depthwise_conv2d(fingerprint_4d, depthwise_filter, [1,1,1,1], padding=self.padding)     
            self.ds_conv1 = tf.nn.conv2d(self.de_conv1, pointwise_filter, [1,1,1,1], padding=self.padding) + batch_bias
            #self.bn_layer1 = tf.nn.batch_normalization(ds_conv1, mean, variance, beta, gamma, 0.001)
            self.ds_relu1 = tf.nn.relu6(self.ds_conv1)
            
            self.parameters += [depthwise_filter, pointwise_filter]
            #self.batch_parameters += [beta, gamma, mean, variance]
            self.batch_parameters += [batch_bias]

 
        # conv2
        with tf.name_scope('conv2') as scope:
            depthwise_filter = tf.Variable(tf.truncated_normal([4, 2, self.conv_output_channel, 1], dtype=tf.float32,
                                                               stddev=1e-1), name='dw_weights')
            pointwise_filter = tf.Variable(tf.truncated_normal([1, 1, self.conv_output_channel, self.conv_output_channel], dtype=tf.float32,
                                                               stddev=1e-1), name='pw_weights')            
            batch_bias = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='batch_bias')
            #beta = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='beta')
            #gamma = tf.Variable(tf.ones([self.conv_output_channel], dtype=tf.float32), name='gamma')
            #mean = tf.Variable(tf.zeros([self.conv_output_channel], dtype=tf.float32), name='mean')
            #variance = tf.Variable(tf.ones([self.conv_output_channel], dtype=tf.float32), name='variance')
            
            self.de_conv2 = tf.nn.depthwise_conv2d(self.ds_relu1, depthwise_filter, [1,1,1,1], padding=self.padding)     
            self.ds_conv2 = tf.nn.conv2d(self.de_conv2, pointwise_filter, [1,1,1,1], padding=self.padding) + batch_bias
            #self.bn_layer2 = tf.nn.batch_normalization(ds_conv2, mean, variance, beta, gamma, 0.001)
            self.ds_relu2 = tf.nn.relu6(self.ds_conv2)
            
            self.parameters += [depthwise_filter, pointwise_filter]
            self.batch_parameters += [batch_bias]
            
            self.gru_input_shape = self.ds_relu2.get_shape().as_list()
            #[-1, 43, 8, 48]

    def rnn_layers(self):
        self.rnn_units = 40
        #gru_input_shape = self.ds_relu2.get_shape().as_list()
        with tf.name_scope('RNN1') as scope:
            self.flow = tf.reshape(self.ds_relu2, [-1, self.gru_input_shape[-3], 
                                                    self.gru_input_shape[-2] * self.conv_output_channel])
            
            self.gru_cell1 = tf.contrib.rnn.GRUCell(self.rnn_units, name='gru1')
            #initial_state = self.gru_cell1.zero_state(self.time_size, dtype=tf.float32)
            self.rnn_output1, self.rnn_state1 = tf.nn.dynamic_rnn(cell=self.gru_cell1, inputs=self.flow, dtype=tf.float32)  
        
    def fc_layers(self):
        self.fc_output_channel1 = 64
        self.label_count = 12
        with tf.name_scope('fc1') as scope:
            fc_filter = tf.Variable(tf.truncated_normal([self.rnn_units, self.fc_output_channel1], 
                                                        stddev=1e-1), name='weights')
            fc_bias = tf.Variable(tf.zeros([self.fc_output_channel1]))
            
            #fc_input = tf.reshape(self.rnn_output2, [-1, self.rnn_units])
            fc_input = tf.reshape(self.rnn_state1, [-1, self.rnn_units])
            
            self.fc1 = tf.matmul(fc_input, fc_filter) + fc_bias
            #self.fc_relu1 = tf.nn.relu(self.fc1)
            self.fc_relu1 = tf.nn.relu6(self.fc1)
            
            self.parameters += [fc_filter, fc_bias]
            
        with tf.name_scope('fc2') as scope:
            fc_filter = tf.Variable(tf.truncated_normal([self.fc_output_channel1, self.label_count], 
                                                        stddev=1e-1), name='weights')
            fc_bias = tf.Variable(tf.zeros([self.label_count]))
            
            self.fc2 = tf.matmul(self.fc_relu1, fc_filter) + fc_bias
            
            self.parameters += [fc_filter, fc_bias]
    
    def load_weights(self, weights, batch_para, gru_para, sess):
        for i in range(len(weights)):
            sess.run(self.parameters[i].assign(weights[i]))
        for j in range(len(batch_para)):
            sess.run(self.batch_parameters[j].assign(batch_para[j]))
        for k in range(4):
            sess.run(self.gru_cell1.weights[k].assign(gru_para[k]))


# In[10]:


model_settings = {}
model_settings['fingerprint_size'] = 490
model_settings['label_count'] = 12
model_settings['desired_samples'] = 16000
model_settings['window_size_samples'] = 640
model_settings['window_stride_samples'] = 320
model_settings['dct_coefficient_count'] = 10

time_size = 49
frequency_size = 10


# In[1]:


test_file = open('./test_list.txt')
test_lines = test_file.readlines()

labels = './ds_rnn_labels.txt'

label_list = [line.rstrip() for line in tf.gfile.GFile(labels)]


# In[12]:


sess = tf.InteractiveSession()
#例化audio_processor
#audio_processor = get_mfcc.AudioProcessor(model_settings)
fingerprint_input = tf.placeholder(tf.float32, [None, time_size, frequency_size, 1])
#例化网络
net = ds_rnn(fingerprint_input, frequency_size, time_size, weights_value, batch_value, grucell_value, sess)

#result_file = open('./result/test_mymodel_alllayer_result.dat', 'w')

error_count = 0
#for i in range(0, len(test_lines)):
for i in range(0, 1000, 25):
    line = test_lines[i]
    line_ = line.replace('\n', '')
    test_labels = line_.split("/", 1)
    wav = '/export/userhome/zry/database/kws/'+line_
    
    #fingerprints = audio_processor.get_data(model_settings, wav, sess)
    #print(wav)
    my_spectrogram = my_audio.my_spectrogram(wav)
    #print(np.shape(my_spectrogram))
    fingerprints = my_audio.my_mfcc(my_spectrogram)           #这里为输入数据
    #print(np.shape(fingerprints))
       
    fingerprints_3d = fingerprints.reshape((-1, 49, 10, 1))
    prob = sess.run(net.probs[0], feed_dict = {net.fingerprint_input: fingerprints_3d})   #这里为输出结果
    preds = (np.argsort(prob)[::-1])[0:2]
    #print(i,  preds,  label_list[preds[0]])
    #result_file.write(str(label_list[preds[0]]))
    if test_labels[0] not in label_list:
        test_labels[0] = '_unknown_'
    if test_labels[0] != label_list[preds[0]]:
        print(i, label_list[preds[0]], test_labels[0])
        
        error_count += 1
    
#result_file.close()


#a = len(test_lines)
#a = 1000
#b = error_count
#print((a-b)/a *100)


# In[ ]:


'''
准确率88.8
'''


# In[13]:


'''
##单次测试
sess = tf.InteractiveSession()
#例化audio_processor
audio_processor = get_mfcc.AudioProcessor(model_settings) 
fingerprint_input = tf.placeholder(tf.float32, [None, time_size, frequency_size, 1])
#例化网络
net = ds_rnn(fingerprint_input, frequency_size, time_size, weights_value, batch_value, grucell_value, sess)

#wav = '/export/userhome/zry/database/kws/right/fdb5155e_nohash_2.wav'
#wav = '/export/userhome/zry/database/kws/right/18f8afd5_nohash_3.wav'
wav = '/export/userhome/zry/database/kws/right/aa48c94a_nohash_0.wav'


#fingerprints = audio_processor.get_data(model_settings, wav, sess)
#fingerprints_3d = fingerprints.reshape((-1, 49, 10, 1))

x = np.arange(0, 49, 0.1)
fingerprints_3d = x.reshape((-1, 49, 10, 1))

prob = sess.run(net.probs[0], feed_dict = {net.fingerprint_input: fingerprints_3d})

dw1_result = sess.run(net.de_conv1, feed_dict = {net.fingerprint_input: fingerprints_3d})
pw1_result = sess.run(net.ds_conv1, feed_dict = {net.fingerprint_input: fingerprints_3d})
relu1_result = sess.run(net.ds_relu1, feed_dict = {net.fingerprint_input: fingerprints_3d})

dw2_result = sess.run(net.de_conv2, feed_dict = {net.fingerprint_input: fingerprints_3d})
pw2_result = sess.run(net.ds_conv2, feed_dict = {net.fingerprint_input: fingerprints_3d})
relu2_result = sess.run(net.ds_relu2, feed_dict = {net.fingerprint_input: fingerprints_3d})
gru_result = sess.run(net.rnn_state1, feed_dict = {net.fingerprint_input: fingerprints_3d})

fc1_result = sess.run(net.fc1, feed_dict = {net.fingerprint_input: fingerprints_3d})
fc2_result = sess.run(net.fc2, feed_dict = {net.fingerprint_input: fingerprints_3d})
    
preds = (np.argsort(prob)[::-1])[0:3]
'''


import struct

k = []
word_list = []


with open('./result_data_hex.txt','r') as f:
    line = f.readline()
    while line:
        line = line.strip('\n')
        line = bytes().fromhex(line)
        p, = struct.unpack('!f', line)
        k.append(p)
        line = f.readline()

with open('../ds_rnn_labels.txt','r') as f:
    line = f.readline()
    while line:
        word = line.strip('\n')
        word_list.append(word)
        line = f.readline()

max_location = k.index(max(k))


with open('./kws_result_data.txt',"w") as f:
    for i in range(len(k)-1):
        f.write(str(k[i]))
        f.write('\n')
    f.write(str(k[len(k)-1]))
    f.write('\n')
    f.write('\n')
    f.write('THE RESULT IS:\n'+word_list[max_location])
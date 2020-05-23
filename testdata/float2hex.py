import struct
import os
k = []
m = []
with open('./data.dat','r') as f:
    line = f.readline()
    while line:
        line = line.strip('\n')
        value = float(line)
        m.append(str(value))
        k.append(struct.pack('>f', value).hex()) 
        line = f.readline()
		
file_id = 0

for n in range(1,41):
    with open('./test'+str(n)+'/input_kwsright_hex.txt',"w") as f:
        for i in range(file_id, file_id+489):
            f.write(k[i])
            f.write('\n')
        f.write(k[file_id+489])

    with open('./test'+str(n)+'/input_kwsright.txt',"w") as f:
        for i in range(file_id, file_id+489):
            f.write(m[i])
            f.write('\n')
        f.write(m[file_id+489])

    file_id = file_id + 490



	
# with open('./weight_all.txt','r') as f:
    # line = f.readline()
    # while line:
        # line = line.strip('\n')
        # value = float(line)
        # m.append(struct.pack('>f', value).hex()) 
        # line = f.readline()

# with open('./weight_all_hex.txt',"w") as f:
    # for i in range(len(m)-1):
        # f.write(m[i])
        # f.write('\n')
    # f.write(m[len(m)-1])



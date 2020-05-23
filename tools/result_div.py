import struct

m = []

with open('./result.dat','r') as f:
    line = f.readline()
    while line:
        line = line.strip('\n')
        value = float(line)
        m.append(str(value))
        line = f.readline()

file_id = 0

for n in range(1,41):
    with open('./test'+str(n)+'/result_data.txt',"w") as f:
        for i in range(file_id, file_id+11):
            f.write(m[i])
            f.write('\n')
        f.write(m[file_id+11])
    file_id = file_id + 12

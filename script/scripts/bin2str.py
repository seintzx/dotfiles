# Convert a binary number into an ASCII strings

text = '0111000001101100011000010110100101100100'
capo = []
s = ''
c = 0
for i in text:
    capo.append(i)
    if c == 7:
        capo = ''.join(capo)
        s += chr(int(str(capo), 2))
        c = -1
        capo = []
    c += 1
print s

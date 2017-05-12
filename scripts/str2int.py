# Those two functions convert a whole string into an integer and reverse

def str2int(s):
    import binascii
    return int(binascii.hexlify(s.encode('utf-8')), 16)

def int2str(n):
    import binascii
    hx = '%x' % n
    hx = hx.zfill(len(hx) + (len(hx) & 1))  # Make even length hex nibbles
    return binascii.unhexlify(hx).decode('utf-8')


st = 'Hello'
num = str2int(st)

print num
print int2str(num)
print hex(num)

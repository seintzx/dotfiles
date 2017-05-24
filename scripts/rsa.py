# RSA simple math 

def str2int(s):
    import binascii
    return int(binascii.hexlify(s.encode('utf-8')), 16)

def int2str(n):
    import binascii
    hx = '%x' % n
    hx = hx.zfill(len(hx) + (len(hx) & 1))  # Make even length hex nibbles
    return binascii.unhexlify(hx).decode('utf-8')

# From plain to cipher
def rsa_enc(s, e, p, q):
    n = p*q
    m = str2int(s)
    c = pow(m,e,n)
    return hex(c)[2:-1]

# From cipher to plain
def rsa_dec(s, e, p, q):
    import gmpy2
    n = p*q
    t = (p-1)*(q-1)
    c = long(s, 16)
    d = gmpy2.invert(e,t)
    m = pow(c,d,n)
    return hex(m)[2:].decode("hex")


p=0xa6055ec186de51800ddd6fcbf0192384ff42d707a55f57af4fcfb0d1dc7bd97055e8275cd4b78ec63c5d592f567c66393a061324aa2e6a8d8fc2a910cbee1ed9

q=0xfa0f9463ea0a93b929c099320d31c277e0b0dbc65b189ed76124f5a1218f5d91fd0102a4c8de11f28be5e4d0ae91ab319f4537e97ed74bc663e972a4a9119307

e=0x6d1fdab4ce3217b3fc32c9ed480a31d067fd57d93a9ab52b472dc393ab7852fbcb11abbebfd6aaae8032db1316dc22d3f7c3d631e24df13ef23d3b381a1c3e04abcc745d402ee3a031ac2718fae63b240837b4f657f29ca4702da9af22a3a019d68904a969ddb01bcf941df70af042f4fae5cbeb9c2151b324f387e525094c41

m = 'try_me_try_me_try_me_try_me_try_me_try_me'

c = rsa_enc(m, e, p, q)
M = rsa_dec(c, e, p, q)

print "Cipher from plain: " + c
print "Plain from cipher: " + M

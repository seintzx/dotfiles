# ciphertext is in hex, as the resulting plaintext
# block_xor_decrypt is the decrypt of ciphertext into hexstring

import binascii

# Repeated Key XOR Encryption
def block_xor_encrypt(s, k):
    i = 0
    imax = len(k)
    ciphertext = ''
    for ch in s:
        ciphertext += ''.join(str(format(ord(ch)^ord(k[i]), '#04x')[2:]))
        if i == imax -1 :
            i = -1
        i += 1
    return ciphertext

# Repeated Key XOR Decryption
def block_xor_decrypt(s, k):
    i = 0
    c = 0
    imax = len(k)
    plaintext = ''
    pair = []
    for ch in s:
        pair.append(ch)
        if c == 1:
            pair = ''.join(pair)
            plaintext += ''.join(format(int(str(pair), 16)^ord(k[i]), '#04x')[2:])  #for hex output
           #plaintext += ''.join(chr(int(str(pair), 16)^ord(k[i]))) #, '#04x')[2:]) #for string output
            c = -1
            pair = []
            if i == imax -1 :
                i = -1
            i += 1
        c += 1
    return plaintext

# Single Char XOR Encryption
def single_xor_encrypt(s, k):
    ciphertext = ''
    for ch in s:
        ciphertext += ''.join(str(format(ord(ch)^ord(k), '#04x')[2:]))
    return ciphertext   

# Single Char XOR Decryption
def single_xor_decrypt(s, k):
    c = 0
    plaintext = ''
    pair = []
    for ch in s:
        pair.append(ch)
        if c == 1:
            pair = ''.join(pair)
            plaintext += ''.join(format(int(str(pair), 16)^ord(k), '#04x')[2:])  #for hex output
           #plaintext += ''.join(chr(int(str(pair), 16)^ord(k))) #, '#04x')[2:]) #for string output
            c = -1
            pair = []
        c += 1
    return plaintext

plaintext = "try_me_try_me_try_me_try_me_try_me_try_me"
plainhex = ''.join(format(ord(ch), '#04x')[2:] for ch in plaintext)

key = "W4R"
key2= "W"

C = block_xor_encrypt(plaintext, key)
P = block_xor_decrypt(C, key)
C1 = single_xor_encrypt(plaintext, key2)
P1 = single_xor_decrypt(C1, key2)

print "Block XOR"
print C         + "  Ciphertext"
print P         + "  Plaintext Decrypt"
print plainhex  + "  PlainHex (Just to check if the decrypt works)"

print "Single XOR"
print C1        + "  Ciphertext"
print P1        + "  Plaintext Decrypt"
print plainhex  + "  Plainhex (Just to check if the decrypt works)"

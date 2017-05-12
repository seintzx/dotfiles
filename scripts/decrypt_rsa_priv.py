# RSA decryption with the private key
# NB: You have to find the private key in some way!!

from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_v1_5
from base64 import b64decode

def decrypt_RSA(privkey, message):
    from Crypto.PublicKey import RSA
    from Crypto.Cipher import PKCS1_0AEP
    from base64 import b64decode
    key = open(privkey, "r").read()
    rsakey = RSA.importKey(key)
    rsakey = PKCS1_0AEP.new(rsakey)
    decrypted = rsakey.decrypt(b64decode(message))


flag="Ni45iH4UnXSttNuf0Oy80+G5J7tm8sBJuDNN7qfTIdEKJow4siF2cpSbP/qIWDjSi+w="

key = open('keypriv', "r").read() 
rsakey = RSA.importKey(key) 
rsakey = PKCS1_v1_5.new(rsakey)
decrypted = rsakey.decrypt(b64decode(flag),'Failure') 
 
print decrypted

flag = "Ciphertext here"
print decrypt_RSA('/path /to /file', flag)

#flag = ciphertext
#key.priv is the private key generated from public key ( inside pubkey we find e and n, factorize n and we have p and q, then we find d)
#NOTE that in the decrypted message we consider it encoded with base64, so if it is not remove the b64decode() and you are good to go

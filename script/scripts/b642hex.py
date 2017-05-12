# decode base64 string and convert into hex string
import base64
import binascii

ciphertext64 = 'ACw5ftWAMhGPpxkbT1iun8aLQ55rGrYUMjeyZfIlYd8Whz8TwCMg1AgeTA83J7qt'
key64 = 'zb9v8uGYo/BWzbhouenY2g=='

ciphertext = binascii.hexlify(ciphertext64.decode('base64'))
key = binascii.hexlify(key64.decode('base64'))

print "Ciphertext: " + ciphertext
print "Key: " + key

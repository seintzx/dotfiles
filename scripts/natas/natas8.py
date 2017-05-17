import base64
import binascii

#decode base64, reverse, hex2bin

##text = "3d3d516343746d4d6d6c315669563362"
##
##text1 = base64.b64decode(text);
##
##text2 = text1[::-1];
##
##text3 = binascii.hexlify(text2);
##
##
##print(text3);#string reverse -> [::-1]



##b'b67edf7adeeb7a5edf9cdee91ddee9f87ee3b75ee7dddddd'
##
text =  b'b67edf7adeeb7a5edf9cdee91ddee9f87ee3b75ee7dddddd ' 

text1 = base64.b64encode(text);

text2 = text1[::-1];

text3 = binascii.hexlify(text2);

print(text3);


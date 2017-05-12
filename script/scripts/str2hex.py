#Convert string into hex 

s = 'hello world!'
h = ''.join(hex(ord(ch))[2:] for ch in s)

print "String: " + s
print "Hex: " + h

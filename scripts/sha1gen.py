#Get SHA-1 hex string 
import sha
s = 'String to Convert'
a = sha.new(s)
print a.hexdigest()

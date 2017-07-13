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


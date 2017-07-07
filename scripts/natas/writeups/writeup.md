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

TODO



### Level 7


















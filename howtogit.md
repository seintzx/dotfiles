# How to create a git repo

The first things you have to do is create an account on [gitHub](www.github.com)  

Now follow this sequence:

- Create a repo on your new account 
- Create a folder in your pc that will contains all the materials of the repo. 
    I suggest you to name it as your repo `mkdir <reponame>`.  
- `echo "# <reponame>" >> README.md`
- `git init`
- `git add README.md`
- `git commit -m "first commit"`
- `git remote add origin https://github.com/<username>/<reponame>.git`
- `git push -u origin master`
You'll be asked to insert your username and password.  

Now you should have all up and running.

From now on is all up to you, just put files into your folder or create hardlink to file that you already have `ln [target] [file name]`.  

#### Add files

You can add file in three ways:

- `git add [filename]` will simply add [filename]
- `git add .` will add all modified file 
- `git add -i` will launch an interactive prompt to add file

#### Commit file

After you add a file you must always commit it.  
Commit a file means adding a very short description to the changes you have made (two or three word, like `fixed that` or `added that`, you can write everything you want and everyone can read it)

#### Push files

Nothing will be displayed on your repo untile you push them.  
For doing it you have to run `git push -u origin master` inside the folder in your computer. 

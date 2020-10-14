# python

I suggest to create a virtual env where you will install all the module you need
for your script, leave the system package only for the dependecies needed by
other program

## venv

- `python -m venv .pyenv`
- add `source ${HOME}/.pyenv/bin/activate` to `.zshrc`
    - after `source $ZSH/oh-my-zsh.sh` if you are using `oh-my-zsh`

> NOTE: I called it `.pyenv` to make it hidden but you can call it whatever you
> prefer and put the folder wherever you want

## packages

Those are some useful plugin for `nvim` and `python` code, along with python
package manager `pip`
```bash
yay -S python-neovim
yay -S python-pip
yay -S yapf flake8
```

# Configuration files

## awesome
This folder contains the config file for `awesomewm`, the theme.lua file, the
icons folder for the theme and some test i am doing.

path to file:
- ~/.config/awesome/rc.lua
- ~/.config/awesome/theme.lua

> NOTE: I did not own the powerarrow theme!  
> It is a copy of the original Powerarrow Dark Awesome WM theme powered by
> [lcpz](www.github.com/lcpz).  
> I just edited it to my own like.

## dunst
This folder contains my `dunst` config file and a script to reload and test it.

path to file:
- ~/.config/dunst/dunstrc
- ~/.config/dunst/reload.sh

## gtk
This folder contains the `gtk` config file.

path to file:
- ~/.config/gtk-3.0/settings.ini
- ~/.gtkrc-2.0

## i3
This folder contains the config file for `i3wm`, i3blocks statusbar and the
config file for py3status.

path to file:
- ~/.config/i3/config
- ~/.config/i3/i3blocks.conf
- ~/.config/i3/i3status.conf

## nvim
This folder contains the config file for `nvim`, my two favourite color scheme
and the file for `vim-plug` plugin manager.

path to file:
- ~/.config/nvim/init.vim
- ~/.config/nvim/colors/inkpot.vim
- ~/.local/share/nvim/site/autoload/plug.vim

## qbit
This folder contains the config file for `qBittorrent`

path to file:
- ~/.config/qBittorrent/qBittorrent.conf

## rofi
This folder contains the config file for `rofi`, given that he uses the
`Xresources` file, this file is also here.

path to file:
- ~/.Xresources

## st
This folder contains the config file for `st` terminal.  
Remember that each time you make changes you need to recompile it.  
Keep it wherever you want.

path to file:
- ~/.config/st

## tmux
This folder contains the config file for `tmux`.

path to file:
- ~/.tmux.conf

## trizen
This folder contains the confi file for `trizen` an arch linux package manager.

path to file:
- ~/.config/trizen/trizen.conf

## urxvt
This folder contains the config file for `urxvt` terminal, and the script for
copy/paste.  
The configurations are done in the `.Xresources` file.  
See [rofi](#rofi) for where this file is allocated.

path to file:
- ~/.urxvt/ext/

> NOTE: I don't use `urxvt` since a long time so this config could be
> deprecated.

## weechat
This folder contains all the config file for `weechat`, and irc terminal-base
client.  
At the moment i haven't configured it, please be patient.

path to file:
- ~/.config/weechat/

## wm_script
This folder contains all the script that i use in some of wm ([xmonad](#xmonad),
[i3 with i3blocks](#i3))

path to file:
- ~/.config/wm_script/

## xmonad
I tried the installation method described below a couple of weeks ago (about
2018-06-28) and seems to be deprecated.

This folder contains the config file for `xmonad` and `xmobar`, remember to
compile xmobar with all the flag or something could not work.

path to file:
- ~/.xmonad/xmonad.hs
- ~/.xmonad/xmobar

### Installation
- Remove all haskell package you have
- Add into `/etc/pacman.conf` before the voice `[comunity]`
```
[haskell-core]  
Server = http://xsounds.org/~haskell/core/$arch
```
- pacman-key -r 4209170B
- pacman-key --lsign-key 4209170B
- pacman -Syu
- pacman -S cabal-install c2hs ghc haskell-xmonad haskell-xmonad-contrib
- cabal update
- cabal install xmobar --flags="all_extensions"

Into --flags="" you can choose the flag you want from the [official
website](http://projects.haskell.org/xmobar/#using-cabal-install)

Reference to
[haskell-core](https://wiki.archlinux.org/index.php/ArchHaskell#haskell-core)

## xorg
This folder contains all the config file for:
- my keyboard (included the alt-caps layout switch)
- touchpad (valid only with `libinput`, i don't think they work with
  `synaptics`)
- my `.xinitrc`

path to file:
- ~/.xinitrc
- /etc/X11/xorg.conf.d/00-keyboard.conf
- /etc/X11/xorg.conf.d/30-touchpad.conf

## zathura
This folder contains the config file for `zathura`, an awesome PDF reader.

path to file:
- ~/.config/zathura/zathurarc

## zsh
This folder contains the config file for `zsh`, i also have some plugins and
theme, see my [wiki](https://gitlab.com/seintz/config/wikis/home) page for
instruction.

path to file:
- ~/.zshrc


.

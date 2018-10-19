# xmonad

## installation

> NOTE: I tried the installation method described below about at 2018-06-28) and
> seems to be deprecated. So for now i don't know a working installation method.

- Remove all haskell package you have
- Add into `/etc/pacman.conf` before the voice `[comunity]`
```
[haskell-core]
Server = http://xsounds.org/~haskell/core/$arch
```
- `pacman-key -r 4209170B`
- `pacman-key --lsign-key 4209170B`
- `pacman -Syu`
- `pacman -S cabal-install c2hs ghc haskell-xmonad haskell-xmonad-contrib`
- `cabal update`
- `cabal install xmobar --flags="all_extensions"`

Into `--flags=""` you can choose the flag you want from the [official
website](http://projects.haskell.org/xmobar/#using-cabal-install)

Reference to
[haskell-core](https://wiki.archlinux.org/index.php/ArchHaskell#haskell-core)

## configuration

This folder contains the config file for `xmonad` and `xmobar`.

> NOTE: remember to compile xmobar with all the flag or something could not
> work.

path to file:
- `~/.xmonad/xmonad.hs`
- `~/.xmonad/xmobar`

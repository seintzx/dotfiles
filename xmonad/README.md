# Installation

- Remove all haskell package you have  
- Add 
    ``` 
    [haskell-core]  
    Server = http://xsounds.org/~haskell/core/$arch
    ```  
    into `/etc/pacman.conf` before the voice `[comunity]`
- pacman-key -r 4209170B
- pacman-key --lsign-key 4209170B
- pacman -Syu
- pacman -S cabal-install c2hs ghc haskell-xmonad haskell-xmonad-contrib
- cabal update
- cabal install xmobar --flags="all_extensions"

Into --flags="" you can choose the flag you want from the [official website](http://projects.haskell.org/xmobar/#using-cabal-install)  
Reference to [haskell-core](https://wiki.archlinux.org/index.php/ArchHaskell#haskell-core)

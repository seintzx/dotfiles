# st

## installation

- create a folder outside this repo
- `yay -G st-git`
- `cd st-git`
- copy the `config.h` here
- modify the `PKGBUILD` file
    ```
    # include config.h and any patches you want to have applied here
    source=('git://git.suckless.org/st' 'config.h')
    sha1sums=('SKIP' 'SKIP')
    ```
- run `makepkg -si`

> NOTE: If you want to update `st` repeat those passages

## configuration

Since you have to compile it every time you want to update there's no
configuration path where to save file, I keep it in my repo and copy it as
needed

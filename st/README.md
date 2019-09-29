# st

- create a folder outside this repo
- copy the `config.h` and `PKGBUILD` file inside of it
- run `makepkg -si`

## OLD

### installation

```bash
yay -S st-git
```

Installing st can be a bit tricky, I'll try to explain my super basic config.

First of all you can copy my `config.h` file and edit it as you wish.

While you run the `yay -S st-git` command it will ask you to edit the PKGBUILD,
say _yes_.

Now you search for this three lines:
```
# include config.h and any patches you want to have applied here
source=('git://git.suckless.org/st')
sha1sums=('SKIP')
```

They have to become this:
```
# include config.h and any patches you want to have applied here
source=('git://git.suckless.org/st' 'config.h')
sha1sums=('SKIP' 'SKIP')
```

Now you save and exit, it will ask again if you want to edit but this time we
say _NO_ and we continue with the installation.

### configuration

This folder contains the config file for `st` terminal.

Remember that each time you make changes you need to recompile it.

Keep it wherever you want.

path to file:
- `~/.config/st`

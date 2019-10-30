# zsh

## installation

```bash
yay -S zsh
```

## oh my zsh

### installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### theme

```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### plugins

#### zsh-256color

```
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )
```

#### zsh-syntax-hughlight

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## configuration

## file path

- `~/.zshrc`
- `~/.zshrc.pre-oh-my-zsh`
- `~/.oh-my-zsh/custom/alias.zsh`
- `~/.oh-my-zsh/custom/export.zsh`
- `~/.oh-my-zsh/custom/keybind.zsh`

---

## OLD

Those were my configuration and installation steps before switching to
`oh-my-zsh`

## installation

```bash
yay -S zsh
yay -S zsh-theme-powerlevel9k
yay -S fasd
```

First thing to do: change the default shell!

Open a terminal and type `chsh`, note that you are changing shell for CURRENT
USER ONLY.

You will be ask to prompt your password, do it. Then write `/bin/zsh` and hit
_Enter_.

## configuration

This folder contains the config file for `zsh`.

path to file:
- `~/.zshrc`

## plugins

### zgen

It's a plugin manager for zsh, check it out
[here](https://github.com/tarjoilija/zgen)

Install with:
```bash
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```
Put this in your `.zshrc` and it will handle every plugin
```bash
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"
    # theme
    zgen load bhilburn/powerlevel9k powerlevel9k
    # plugin
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions
    zgen load Tarrasch/zsh-autoenv
    # save to init script
    zgen save
fi
```

### theme

I use [powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme.

### fasd

Awesome plugin for navigate much faster across folder.

Check it [here](https://github.com/clvv/fasd).

Then add this line to `~/.zshrc`:
```bash
eval "$(fasd --init auto)"
```

# zsh

## installation

```bash
yay -S zsh
yay -S fasd
```

## oh my zsh

### installation

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### powerlevel10k theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# copy zsh config only
p10k config
# follow the config wizard
# replace p10k.zsh after wizard
```

### plugins

#### zsh-256color

```bash
( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )
```

#### zsh-syntax-hughlight

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## configuration

This folder contains my configurations files for `zsh` shell, along with some
useful file for `oh-my-zsh`

## file path

- `~/.zshrc`
- `~/.p10k.zsh`
- `~/.oh-my-zsh/custom/alias.zsh`
- `~/.oh-my-zsh/custom/export.zsh`
- `~/.oh-my-zsh/custom/keybind.zsh`



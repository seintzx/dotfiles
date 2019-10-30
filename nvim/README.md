# nvim

## installation

```bash
yay -S neovim
yay -S gvim
yay -S vim-runtime
```

Now we download VimPlug as plugin manager (it will create folder automatically).

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

In the `init.vim` file I have `~/.local/share/plugged` as folder for the
plugins, you can change it before installing them.

Once you are set, open nvim and type `:PlugInstall` and `:PlugUpgrade`.

## configuration

This folder contains the config file for `nvim`, my two favourite color scheme
and the file for `vim-plug` plugin manager.

## file path

- `~/.config/nvim/init.vim`
- `~/.config/nvim/colors/inkpot.vim`
- `~/.local/share/nvim/site/autoload/plug.vim`

# windows manager configuration's files

## awesome

Configuration files, themes, icons and lain  
Path: ~/.config/awesome  
Icons in /usr/share/awesome/icons

NOTE: Not used since a lot of time.  


## i3

Config files for i3 and i3blocks.  

```bash
cp ~/config/wm/i3/* ~/.config/i3/
```

There is also a config file for `i3status` because it is used in the `py3status` config, but it doesn't work out for me.  


## xmonad

Configuration file for xmonad and xmobar  
Path: ~/.xmonad/xmonad.hs  
Path: ~/.xmonad/xmobarrc  

## rofi

I use rofi instead of dmenu.  
I have three tab:

1. Run: to launch application, like `dmenu`
2. Clipboard: clipboard manager thanks to `greenclip`
3. Calculator: thanks to `qalc`

Rofi colorscheme and settings are stored in the .Xresources file.  

```bash
cp -r ~/config/shell/rofi/Xresources ~/.Xresources
```


### wm_script

This folder contains all the script i use in my wm, like in status bar, startup and run programs.  

I keep them in `~/.config/wm_script`.  

```bash
cp -r ~/config/wm/wm_script/* ~/.config/wm_script/
```



# List of all my programs

> NOTE: This wiki is almost deprecated, most of the things can be found in the
> `README.md` files in the folders of this repo, I am restructuring this to
> something else

> NOTE 2: I am trying to create an `ansible` playbook to cover all the boring
> configuration process

As first thing i suggest you to install a package manager, you can choose which
one you prefer.

I use `yay` so i'll guide you to install it.

## yay

Check out [yay here](https://github.com/Jguer/yay).
```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## my programs

> "One command to rule them all, One command to find them, One command to bring
> them all, and in the darkness install them."

```bash
pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 !="base-devel" ) { print name } }'
```

This command will list all the packages you have explicitly installed, even the
one from _AUR_. [Source](https://bbs.archlinux.org/viewtopic.php?pid=690438).

Or you can use the older version:
- `yay -Qqem` list packages from AUR
- `yay -Qqen` list packages not from AUR

Now we start with the installation of everythings I usually need.
> NOTE: I used `yay` for _non-AUR_ and for _AUR_ packages but you can split
> the process.

## one-command install

> NOTE: It's not working very well

With `yay -S $(cat packages.txt)` you can install packages from a list.

With the `pacman` command above you can create that list just adding `>
packages.txt` at the end of it.

### kernel blacklist

blacklist `psmouse`:
```
sudo nvim /etc/modprobe.d/modprobe.conf
blacklist psmouse
```

### venv

- `python -m venv .pyenv`
- add `source ${HOME}/.pyenv/bin/activate` to `.zshrc`
    - after `source $ZSH/oh-my-zsh.sh` if you are using `oh-my-zsh`

> NOTE: i called it `.pyenv` to make it hidden but you can call it whatever you
> prefer and put the foldere wherever you want

### driver

- `yay -S xf86-video-intel intel-dri`
- `yay -S xf86-input-libinput`
- `yay -S alsa-utils pulseaudio pulseaudio-alsa pavucontrol`

### bluetooth

- `yay -S bluez bluez-utils bluez-hid2hci blueman`
- `yay -S pulseaudio-bluetooth pulseaudio-bluetooth-a2dp-gdm-fix`

### xorg

- `yay -S xorg xorg-xinit xorg-twm xorg-xclock xorg-server xorg-setxkbmap xorg-xrdb`
- `yay -S numlockx xsel arandr`

### shell

- `yay -S intel-opencl-runtime hashcat john`
- `yay -S zsh zsh-theme-powerlevel9k`
- `yay -S neovim gvim vim-runtime`
- `yay -S ncurses5-compat-libs`
- `yay -S st-git`
- `yay -S unzip`
- `yay -S htop`
- `yay -S tmux`
- `yay -S sp` (spotify command line utility for awesome widget)

### wm

- `yay -S rofi rofi-greenclip networkmanager-dmenu nm-connection-editor`

### i3

- `yay -S i3-gaps i3lock i3status i3blocks perl-anyevent-i3`
- `yay -S py3status python-tzlocal python-pytz python-pydbus python-dbus`
- `pip3 install pygi`

### awesome

- `yay -S awesome lain-git i3lock`

### themes and fonts

- `yay -S gtk3 libxft ttf-font-awesome`
- `yay -S numix-themes-darkblue`
- `yay -S nerd-fonts-complete`
- `yay -S otf-font-awesome-4`
- `yay -S ttf-font-awesome-4`
- `yay -S arc-icon-theme`
- `yay -S ttf-fira-code`
- `yay -S qt5ct` and add `export QT_QPA_PLATFORMTHEME="qt5ct"` to your `.xinitrc`

### android

- `yay -S cydia-impactor`
- `yay -S android-tools`
- `yay -S genymotion`
- `yay -S ntfs-3g`
- `yay -S libmtp gvfs-mtp`

### browser

- `yay -S tor torify torsocks tor-browser`
- `yay -S firefox flashplugin`
- `yay -S chromium`

### ctf

- `yay -S radare2 wireshark-qt tshark`
- `yay -S netcat nmap sqlmap tig`
- `yay -S volatility-git`
- `yay -S metasploit`
- `yay -S trid`

### chat client

- `yay -S telegram-desktop`
- `yay -S slack-desktop`
- `yay -S skypeforlinux`
- `yay -S weechat`
- `yay -S signal`

### docker

- `yay -S docker docker-machine docker-compose`

### latex

- `yay -S texlive-most texlive-lang`
- `yay -S sublime-text-dev`
- `yay -S texstudio`
- `yay -S pandoc`

### university

- `yay -S intellij-idea-ultimate-edition-jre`
- `yay -S intellij-idea-ultimate-edition`
- `yay -S dbmain`

### vpn

- `yay -S openvpn networkmanager-openvpn`

### virtualbox

- `yay -S virtualbox virtualbox-host-modules-arch`
- `yay -S virtualbox-guest-iso virtualbox-guest-utils`
- `yay -S linux-headers virtualbox-ext-oracle`

### java

- `yay -S java-environment-common java-openjfx java-runtime-common`
- `yay -S jdk8-openjdk jre8-openjdk jre8-openjdk-headless`
- `yay -S archlinux-java-run eclipse-java`

### utils

- `yay -S wireless_tools xdotool sysstat acpi acpid`
- `yay -S scrot imagemagick shotwell feh gimp`
- `yay -S qt4 vlc thunar thunar-volman gvfs`
- `yay -S zathura zathura-pdf-mupdf evince`
- `yay -S jpegoptim optipng`
- `yay -S libreoffice-fresh`
- `yay -S qalculate-gtk`
- `yay -S git wget curl`
- `yay -S gnome-keyring`
- `yay -S keepassxc bitwarden`
- `yay -S qbittorrent`
- `yay -S thunderbird`
- `yay -S spotify`
- `yay -S dnsmasq`
- `yay -S openssh`
- `yay -S calibre`
- `yay -S mumble`
- `yay -S dunst`
- `yay -S xclip`
- `yay -S unrar`
- `yay -S zoom`
- `yay -S iw`

### Python package

- `yay -S python-neovim`
- `yay -S yapf flake8`
- `yay -S python-pip`

- `pip install pycrypto`
- `pip install requests`

## BIOS update

```
yay -S fwupd
sudo fwupdmgr get-updates
sudo fwupdmrg refresh
sudo fwupdmrg update
```

## TTY setting

Those packages are needed for some problems wiht tty fonts and other packages
```
yay xorg-fonts-misc
yay ttf-symbola
yay terminus-font
yay fasd
```

## odroid media server

### minidlna

follow [this](https://wiki.archlinux.org/index.php/ReadyMedia), config file can
be found in my config repo

### vpn

`pacman -S openvpn openssl easy-rsa`

- [guide](https://wiki.archlinux.org/index.php/OpenVPN_Checklist_Guide)
- run `openvpn --genkey --secret /etc/openvpn/server/ta.key` on the server
- use `ovpngen.sh` to generate config

## configuration

You can see the configuration of all my programs in my [config
repo](https://gitlab.com/seintz/config)

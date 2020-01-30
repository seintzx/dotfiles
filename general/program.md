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

### driver

- alsa-utils
- pavucontrol
- pulseaudio
- pulseaudio-alsa
- xf86-video-intel

### bluetooth

- blueman
- bluez
- bluez-hid2hci
- bluez-utils
- pulseaudio-bluetooth
- pulseaudio-bluetooth-a2dp-gdm-fix

### shell

- hashcat
- intel-opencl-runtime
- john
- ncurses5-compat-libs
- unzip

### themes and fonts

- arc-icon-theme
- libxft
- numix-themes-darkblue

- nerd-fonts-complete
- otf-font-awesome-4
- ttf-fira-code
- ttf-font-awesome
- ttf-font-awesome-4
- ttf-hack

### android

- android-tools
- cydia-impactor
- genymotion
- gvfs-mtp
- libmtp
- ntfs-3g

### browser

- chromium
- firefox
- flashplugin
- tor
- tor-browser
- torify
- torsocks

### ctf

- metasploit
- netcat
- nmap
- radare2
- sqlmap
- tig
- trid
- tshark
- volatility-git
- wireshark-qt

### chat client

- signal
- skypeforlinux
- slack-desktop
- telegram-desktop

### docker

- docker
- docker-compose
- docker-machine

### latex

- pandoc
- sublime-text-dev
- texlive-bin
- texlive-most

### vpn

- openvpn

### virtualbox

- linux-headers
- virtualbox
- virtualbox-ext-oracle
- virtualbox-guest-iso
- virtualbox-guest-utils
- virtualbox-host-modules-arch

### utils

- acpi
- acpid
- bitwarden
- calibre
- curl
- evince
- feh
- gimp
- gnome-keyring
- gvfs
- imagemagick
- iw
- jpegoptim
- keepassxc
- libreoffice-fresh
- mumble
- optipng
- qt4
- scrot
- shotwell
- sp
- spotify
- sysstat
- thunar
- thunar-volman
- thunderbird
- unrar
- vlc
- wget
- whois
- wireless_tools
- xclip
- xdotool
- zoom

## configuration

You can see the configuration of all my programs in my [config
repo](https://gitlab.com/seintz/config)

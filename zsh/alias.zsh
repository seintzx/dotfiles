# ALIASES ======================================================================

# terminal aliases
alias -g g='| grep -v grep | grep -i --color=auto'
alias grep='grep --color=auto'
alias l='ls -lh --color=auto'
alias la='ls -lhA --color=auto'
alias cp='cp -ri'
alias mv='mv -i'
alias del='shred -uvz'
alias rm='rm -rI'
alias md='mkdir -p'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim -p'
alias s='startx'
alias ct='cd /tmp'
alias za='zathura --fork'

# vpn aliases
alias cvpn='cd ${HOME}/vpn/cesvpn ; sudo openvpn ep-udp-1195-santa.ovpn'
alias vpn='${HOME}/vpn/nord/auth.sh'

# git aliases
alias gacp='git add -A && git commit -a --allow-empty-message -m "" && git push'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gce='git commit -a --allow-empty-message -m ""'
alias gp='git push'
alias gpm='git push -u origin master'
alias gl='git pull'
alias gs='git status -sb'
alias gd='git diff'

# others aliases
alias msfconsole="msfconsole -x \"db_connect ${USER}@msf\""
alias vbox='sudo VirtualBox'
alias myip='curl -s http://ipinfo.io/ip'
alias ze='7z a -p -r -mx=9 -mhe -t7z'
alias zd='7za e'
alias musb='sudo cryptsetup luksOpen /dev/sdb USBDrive ;  sudo mount /dev/mapper/USBDrive /USBDrive'
alias uusb='sudo umount /USBDrive ;  sudo cryptsetup luksClose USBDrive'
alias -g xc='| xsel --clipboard'
alias -g xv='| xsel --clipboard'
alias -g bd='| base64 -d'
alias -g be='| base64'

# config alias
alias zconf='vim ~/.zshrc'





# OLD ==========================================================================
# fasd alias
# alias c='fasd_cd -d -i'

# pyvenv aliases
# source ${HOME}/.pyenv/bin/activate
# export PATH=~/.npm-global/bin:$PATH

# plugin source
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

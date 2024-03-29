# ALIASES ======================================================================

# terminal aliases
alias -g g='| grep -i --color=auto'
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
alias paux='ps aux | grep -v grep | grep -i --color=auto'
alias 1m='xrandr --output eDP1 --mode 3840x2160 --output DP3 --off'
alias 2m='xrandr --output eDP1 --mode 3840x2160 --output DP3 --pos 3840x0 --panning 3840x2160+3840+0'

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
alias zd='7za x'
alias musb='sudo cryptsetup luksOpen /dev/sdb USBDrive ;  sudo mount /dev/mapper/USBDrive /USBDrive'
alias uusb='sudo umount /USBDrive ;  sudo cryptsetup luksClose USBDrive'
alias remove_dups='md5sum * | sort | awk '"'"'BEGIN{lsthash = ""} $1 == lsthash {print $2} {lsthash=$1}'"'"' | xargs echo'
alias -g xc='| xsel --clipboard'
alias -g xv='| xsel --clipboard'
alias -g bd='| base64 -d'
alias -g be='| base64'
alias -g jj="| jq .''"

# config alias
alias zconf='vim ~/.zshrc'

# brave chips
alias outlook='brave --app=https://outlook.office.com/mail/inbox &'
alias 3cx='brave --app=https://10.3.2.100:5001/webclient/#/people &'
alias prtg='brave --app=https://prtg.aciglobal.it/welcome.htm &'

# yoroi alias
alias orokup='nmcli connection up oroku --ask'
alias orokud='nmcli connection down oroku'
alias abuse='python ${HOME}/hub/work/script/mailabuse/mailabuse.py'
alias burp='java --illegal-access=permit -Dfile.encoding=utf-8 -javaagent:${HOME}/documents/burpsuitepro/BurpSuiteLoader_v2020.12.1.jar -noverify -jar ${HOME}/documents/burpsuitepro/burpsuite_pro_v2020.12.1.jar &'


# OLD ==========================================================================
# fasd alias
# alias c='fasd_cd -d -i'

# pyvenv aliases
# source ${HOME}/.pyenv/bin/activate
# export PATH=~/.npm-global/bin:$PATH

# plugin source
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export VISUAL="vim"

# terminal aliases
alias las='ls -la --color=auto'
alias ls='ls -l --color=auto'
alias fckbeep='xset -b'
alias scrblk='xset s off & xset s blank & xset -dpms' #-dpms
alias diocane='fckbeep & scrblk & echo fuckingdone'
alias lump='xbacklight -inc 10'
alias lumm='xbacklight -dec 10'
alias susp='systemctl suspend'
alias sshot='import -window root'

# Yaourt aliases
alias sysup='yaourt -Syu'

# Compiler aliases
alias ccomp='gcc -Wall -o'

# openssl, vpn aliases
alias aesenc='openssl aes-256-cbc -a -salt'
alias aesdec='openssl aes-256-cbc -d -a'
alias vpnces='cd ~/vpncesena ; sudo openvpn seintz-TO-IPFire.ovpn'

# git aliases
alias gpush='git push -u origin master'
alias gadd='git add'
alias gcom='git commit -m'

# others aliases
alias vbox='sudo VirtualBox'




#alias scrlock='i3lock -c 400040 -n -e' #######-c: set color, -n: kill the app after unlock, -e: ignore empty input

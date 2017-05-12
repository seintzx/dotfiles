export VISUAL="vim"
alias las='ls -la --color=auto'
alias ls='ls -l --color=auto'
alias fckbeep='xset -b'
alias scrblk='xset s off & xset s blank & xset -dpms' #-dpms
alias fixbeep='fckbeep & scrblk & echo fuckingdone'
alias lump='xbacklight -inc 10'
alias lumm='xbacklight -dec 10'
alias sysup='yaourt -Syu'
alias ccomp='gcc -Wall -o'
alias sshot='import -window root'
alias aesenc='openssl aes-256-cbc -a -salt'
alias aesdec='openssl aes-256-cbc -d -a'
alias susp='systemctl suspend'
alias gitpush='git push -u origin master'






#alias scrlock='i3lock -c 400040 -n -e' #-c: set color, -n: kill the app after unlock, -e: ignore empty input

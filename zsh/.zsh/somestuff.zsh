# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:low    er:]}' '+r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/seintz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

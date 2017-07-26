##Set some keybindings
#Commented line below makes history slow 
##############################################
typeset -g -A key

bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[8~' end-of-line
bindkey '^[[6~' down-line-or-history
#bindkey '^[[A~' up-line-or-search
#bindkey '^[[D~' backward-char
#bindkey '^[[B~' down-line-or-search
#bindkey '^[[C~' forward-char
#bindkey '^[[2~' overwrite-mode
#############################################

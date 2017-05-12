#Enable color in promp
autoload -U colors && colors


function current_pwd {
 echo $(pwd | sed -e "s,^$HOME,~,")
}
 
PROMPT='${PR_GREEN}%n@ %{$reset_color%}${PR_YELLOW}$(current_pwd)%{$reset_color%}: $ '

#Enable color in promp
autoload -U colors && colors

# SOME FUNC ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function prompt_char {  git branch >/dev/null 2>/dev/null && echo '±' && return echo '○'    }
function current_pwd {  echo $(pwd | sed -e "s,^$HOME,~,")  }

# GIT ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function parse_git_branch() {   (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null  }
 
# Show different symbols as appropriate for various Git repository states
function parse_git_state() {
 
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
 
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
 
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
 
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
 
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
 
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
 
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
 
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}
function git_prompt_string() {  local git_where="$(parse_git_branch)"   [ -n "$git_where" ] && echo "on %{$fg[blue]%}${git_where#(refs/heads/|tags/)}$(parse_git_state)"    } 

# FINAL PROMPT -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PROMPT='${PR_GREEN}%n@ %{$reset_color%}${PR_YELLOW}$(current_pwd)%{$reset_color%}: $ '

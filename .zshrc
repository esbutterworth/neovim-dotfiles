# Load version control information
autoload -Uz vcs_info
autoload -U colors && colors
precmd() { vcs_info }

for f in ~/.gusto/*; do source $f; done

# prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

##### aliases
# general:
alias ls='ls -Gl'
alias la='ls -a'

# git
alias gc='git commit -m $1'
alias gpl='git pull'
alias gps='git push'
alias gpf='git push --force'
alias gcm='git checkout main'
alias gcb='git checkout -b $1'
alias gri='f() { git rebase -i HEAD~$1 };f'
alias grim='git rebase -i main'
alias gpn='f() { git push --set-upstream origin $(parse_git_branch) };f'

# ZP
alias envup='bundle install; bin/rails db:migrate'
alias rc='bin/rails c'

zstyle ':vcs_info:git:*' formats 'on branch %b'
setopt PROMPT_SUBST
PROMPT='%F{cyan}[$(parse_git_branch)] %F{green}%~ %F{231}%# '

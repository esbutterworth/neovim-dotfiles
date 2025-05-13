# Load version control information
autoload -Uz vcs_info
autoload -U colors && colors
precmd() { vcs_info }


# prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

export EDITOR=nvim

##### aliases
# general:
alias ls='ls -Gl'
alias la='ls -a'

# git
alias gc='git commit -m $1'
alias gcv='git commit -v'
alias gcn='git commit --no-verify -m $1'
alias gcf='lefthook run fix && git add . && gcn $1'
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias gpf='git push --force'
alias gbd='git branch -D $1'
alias gcm='git checkout main'
alias gcb='git checkout -b $1'
alias gcl='git checkout -'
alias gco='git checkout $1'
alias gap='git add -N .; git add -p'
alias gri='f() { git rebase -i HEAD~$1 };f'
alias grim='git rebase -i main'

# ZP
alias envup='bundle install; bin/rails db:migrate'
alias rc='bin/rails c'
alias rs='bin/rspec'
alias newmain='gcm && gpl && envup'
alias zp='cd ~/workspace/zenpayroll'

zstyle ':vcs_info:git:*' formats 'on branch %b'
setopt PROMPT_SUBST
PROMPT='%F{cyan}$(parse_git_branch) %F{green}%~ %F{231}%# '

source ~/.gusto/init.sh
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

. "$HOME/.local/bin/env"

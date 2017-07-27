#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Load nvm
export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Set Intercom User
export INTERCOM_USER=ricky
export BILLING_SERVICE_AVAILABLE=true

# Skip to the scenic directory
alias scenic="cd ~/code/scenic/"

# Add pilot path
export PATH=$HOME/.pilot/shims:$HOME/.pilot/bin:$PATH
eval $(pilot env)

export PATH="$HOME/.yarn/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Creates PR for your current branch and opens it in a browser window
function pr () {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}

alias gbm='git branch  --merged master'
alias gbnm='git branch --no-merged'
alias gbdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

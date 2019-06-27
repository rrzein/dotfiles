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

export PATH="$HOME/.yarn/bin:$PATH:$HOME/.composer/vendor/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Creates PR for your current branch and opens it in a browser window
function pr () {
  local repo=`git remote -v | grep -m 1 "(push)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  local branch=`git name-rev --name-only HEAD`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}

# Kill port
function killport() {
  lsof -n -i:$1 | grep LISTEN | awk '{print $2}' | xargs kill
}

# Git-specific commands
alias gbm='git branch  --merged master'
alias gbnm='git branch --no-merged'
alias gbdm='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias gpro='git pull --rebase origin master'

function gitdelgone() {
  git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

alias eyes='git shove && pr'

alias kn='until killall node | grep -m 1 "No matching processes belonging to you were found"; do sleep 1 ; done'

# Personal commands
alias code='cd ~/code'
alias addkeys='ssh-add -K ~/.ssh/id_rsa'

alias did="vim +'normal Go' +'r!date' ~/did.txt"

# mkdir and cd into directory
function mcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

## The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/ricky/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ricky/Downloads/google-cloud-sdk/path.zsh.inc'; fi

## The next line enables shell command completion for gcloud.
#if [ -f '/Users/ricky/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ricky/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

alias k=kubectl

function latk() {
  lattice-kubectl $@
}
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

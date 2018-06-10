eval "$(rbenv init -)"
eval "$(thefuck --alias)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=/Users/triet/projects/go
export GOBIN=/Users/triet/projects/go/bin
export PATH=$PATH:$GOPATH/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#export COLORTERM="truecolor"
#
export NLS_LANG=en_US.UTF-8

# CD path
export CDPATH=$GOPATH/src
export CDPATH=~/projects/ruby

# alias ssh xterm 
alias ssh='TERM=xterm-256color ssh'

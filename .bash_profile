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

# Oracle
export OCI_DIR=/opt/oracle/instantclient_12_1

#
export NLS_LANG=en_US.UTF-8

# CD path
export CDPATH=$GOPATH/src

# alias ssh xterm 
alias ssh='TERM=xterm-256color ssh'

# Add python bin
export PYTHON_BIN_PATH=/Users/triet/Library/Python/2.7/bin
export PATH=$PATH:$PYTHON_BIN_PATH

#[[ -s "/Users/triet/.gvm/scripts/gvm" ]] && source "/Users/triet/.gvm/scripts/gvm"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Cellar/postgresql@11/11.6/bin:$PATH"
#export PATH="/usr/local/Cellar/postgresql@9.6/9.6.15_1/bin/:$PATH"
export FZF_DEFAULT_COMMAND='ag -g ""'

# Rust-src
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

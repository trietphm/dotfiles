#export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# lazyload nvm
# all props goes to http://broken-by.me/lazy-load-nvm/
# grabbed from reddit @ https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/

# https://gist.github.com/gfguthrie/9f9e3908745694c81330c01111a9d642
# normal brew nvm shell config lines minus the 2nd one
# lazy loading the bash completions does not save us meaningful shell startup time, so we won't do it
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# add our default nvm node (`nvm alias default 10.16.0`) to path without loading nvm
export PATH="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin:$PATH"
# alias `nvm` to this one liner lazy load of the normal nvm script
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

#lazynvm() {
#  unset -f nvm node npm npx
#  export NVM_DIR=~/.nvm
#  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#  if [ -f "$NVM_DIR/bash_completion" ]; then
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
#  fi
#}
#
#nvm() {
#  lazynvm 
#  nvm $@
#}
# 
#node() {
#  lazynvm
#  node $@
#}
# 
#npm() {
#  lazynvm
#  npm $@
#}
#
#npx() {
#  lazynvm
#  npx $@
#}

export GOPATH=/Users/triet/projects/go
export GOBIN=/Users/triet/projects/go/bin
export PATH=$PATH:$GOPATH/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#export COLORTERM="truecolor"
export HOMEBREW_GITHUB_API_TOKEN=

# Oracle
export OCI_DIR=/opt/oracle/instantclient_12_1

#
export NLS_LANG=en_US.UTF-8

# CD path
export CDPATH=$GOPATH/src

# Get github PR of current commit
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

# alias ssh xterm 
alias ssh='TERM=xterm-256color ssh'
alias joke='curl https://icanhazdadjoke.com'

# Add python bin
export PYTHON_BIN_PATH=/Users/triet/Library/Python/2.7/bin
export PATH=$PATH:$PYTHON_BIN_PATH

#[[ -s "/Users/triet/.gvm/scripts/gvm" ]] && source "/Users/triet/.gvm/scripts/gvm"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/Cellar/postgresql@11/11.7/bin:$PATH"
#export PATH="/usr/local/Cellar/postgresql@9.6/9.6.15_1/bin/:$PATH"
export FZF_DEFAULT_COMMAND='ag -g ""'

# Rust-src
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/

export EDITOR="nvim"

# OpenSSL
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl@1.1/lib/
export GPG_TTY=$(tty)
export HISTIGNORE='pwd:exit:ls:ll:clear'
export HOMEBREW_NO_AUTO_UPDATE=1

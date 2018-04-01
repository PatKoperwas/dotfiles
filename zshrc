# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# Plugins
# plugins=(git)

# Rbenv configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Bin Stubs
export PATH="./bin:$PATH"

# Local Bin 
export PATH="$HOME/.bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# MySQL
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# PostgreSQL
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# OSX Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Dircolors
# eval $(dircolors -b ~/.dircolors)
export CLICOLOR=1

# Go
export GOPATH=$HOME/Documents/Code/golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Yarn
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

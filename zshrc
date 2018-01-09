# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="patkoperwas"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/pgsql/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/ruby/bin/"
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
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Documents/Code/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Kiex
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Yarn
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# OPAM configuration
. /Users/patrickkoperwas/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

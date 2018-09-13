# Fish Config
set fish_greeting ""

## Alias
alias gcm='git checkout master'
alias glog='git log --oneline --decorate'

alias vim='nvim'

# Bins
set -gx PATH ./bin $PATH

## Go
set --export GOPATH $HOME/Documents/Code/golang
set -gx PATH $GOPATH/bin $PATH

# Dotnet
set -gx PATH /usr/local/share/dotnet $PATH

# PostgreSQL
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# NPM
set -gx PATH ./node_modules/.bin $PATH

# FZF
set -gx PATH $HOME/.fzf/bin $PATH
set -Ux FZF_DEFAULT_COMMAND "rg -l ''"
set -Ux FZF_CTRL_T_COMMAND "rg -l ''"

# OPAM configuration
set PATH "/Users/patrickkoperwas/.opam/system/bin" $PATH;

# OPAM configuration
source /Users/patrickkoperwas/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# RBENV
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

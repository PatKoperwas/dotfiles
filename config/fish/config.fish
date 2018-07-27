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

# PostgreSQL
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# FZF
set -Ux FZF_DEFAULT_COMMAND "rg -l ''"
set -Ux FZF_CTRL_T_COMMAND "rg -l ''"

# OPAM configuration
set PATH "/Users/patrickkoperwas/.opam/system/bin" $PATH;

# OPAM configuration
source /Users/patrickkoperwas/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

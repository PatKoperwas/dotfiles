# Set paths on M1
set -U fish_user_paths /opt/homebrew/bin/ $fish_user_paths

# Fish Config
set fish_greeting ""

## Alias
alias gcm='git checkout master'
alias glog='git log --oneline --decorate'

# Alias
alias vim='nvim'
alias be='bundle exec'

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

# RBENV
#set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null 2>&1

# Rust
set -gx PATH $HOME/.cargo/bin $PATH

# Fisher Load Custom Key Bindings
if functions -q fish_user_key_bindings
  if not functions -q _keybinder_fish_user_key_bindings
    functions -c fish_user_key_bindings _keybinder_fish_user_key_bindings
  end
end

test -z "$XDG_CONFIG_HOME"; and set XDG_CONFIG_HOME ~/.config

function fish_user_key_bindings
  for file in $XDG_CONFIG_HOME/fish/conf.d/*_key_bindings.fish
    source $file
  end
  if functions -q _keybinder_fish_user_key_bindings
    _keybinder_fish_user_key_bindings
    end
  end

# OPAM configuration
. /Users/patrickkoperwas/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# source ~/.iterm2_shell_integration.fish
# function iterm2_print_user_vars
#   set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
#   iterm2_set_user_var gitBranch "$git_branch"
# end

# M1 Chip / Brew 3.0
set -gx PATH /usr/local/opt/libxml2/bin $PATH

set -gx LDFLAGS "-L/usr/local/opt/libxml2/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libxml2/include"

set -gx PKG_CONFIG_PATH "/usr/local/opt/libxml2/lib/pkgconfig"

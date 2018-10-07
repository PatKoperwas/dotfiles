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

# RBENV
#set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1


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

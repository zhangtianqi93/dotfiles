if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -xg GOPATH $HOME/Work/code/go

fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

zoxide init fish | source

starship init fish | source

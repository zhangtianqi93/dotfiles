if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -gx GOPATH $HOME/Work/code/go
set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# set fish_vi_cursor insert
# set fish_cursor_default block
# set fish_cursor_insert line
# set fish_cursor_replace_one underscore
# set fish_cursor_visual block

# path
fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/bin

# chip
set arch (uname -m)
if test "$arch" = "arm64"
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
else
    #
end

zoxide init fish | source

starship init fish | source

function sson
    set -gx ALL_PROXY socks5://127.0.0.1:1086
    echo -e "已开启代理"
end

function ssoff
    set -e ALL_PROXY
    echo -e "已关闭代理"
end

function ip
    curl -s cip.cc | sed -n '2p' | awk -F: '{ sub(/^[ \t\r\n]+/, "", $2); print $2 }'
end

function ff
    git checkout master
    git pull
    git fetch -p
    git checkout -b "feature/$argv"
    git push --set-upstream origin "feature/$argv"
end

function fix
    git checkout master
    git pull
    git fetch -p
    git checkout -b "hotfix/$argv"
    git push --set-upstream origin "hotfix/$argv"
end

cat ~/.cache/wal/sequences &

if status is-interactive
    # Commands to run in interactive sessions can go here
end

_pure_set_default pure_symbol_prompt ">"
_pure_set_default pure_symbol_reverse_promp "<"
_pure_set_default pure_enable_git false

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

source ~/.cache/wal/colors.fish
source ~/.opam/opam-init/init.fish


# TO FISHFY

set -gx EDITOR nvim
set -gx TERMINAL alacritty
set -gx BROWSER brave

alias new_term="eval $TERMINAL &"

# pipe to clipboard
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"


#my alias
alias sin="sinonimos.py"
alias vi="nvim"
alias v="nvim"
alias vim="vi"
alias active_services="systemctl list-units --type=service --state=active"
alias tmux="tmux -f /home/guilherme/.config/tmux/tmux.conf"
alias dragon="dragon-drag-and-drop"
alias dropon="dragon-drag-and-drop -t"
alias yt="ytfzf -t"

#pywal 
#eval cat ~/.cache/wal/sequences &
#source ~/.cache/wal/colors-tty.sh

#envs

fish_add_path /home/guilherme/go/bin
fish_add_path /home/guilherme/.opam/default/bin
fish_add_path /home/guilherme/scripts
fish_add_path /usr/local/bin
fish_add_path /home/guilherme/.local/share/solana/install/active_release/bin
fish_add_path /usr/lib/ruby/gems/3.0.0
fish_add_path /home/guilherme/.local/share/gem/ruby/3.0.0

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -gx JAVA_HOME /usr/lib64/jvm/java-8-openjdk
set -gx GOPATH /home/guilherme/go
fish_add_path $JAVA_HOME/bin
fish_add_path $GOPATH
fish_add_path /home/guilherme/.nimble/bin:$PATH
fish_add_path /home/guilherme/.mix/escripts:$PATH




# XDG
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_DATA_DIRS /usr/local/share:/usr/share
set -gx XDG_CONFIG_DIRS /etc/xdg


# XDG aliases
set -gx ANDROID_SDK_HOME "$XDG_CONFIG_HOME"/android
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
set -gx GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle

# DONTNET
set -gx DOTNET_ROOT /usr/share/dotnet
set -gx QUTEWAL_DYNAMIC_LOADING true


# javafx
set -gx PATH_TO_FX path/to/javafx-sdk-15.0.1/lib

alias list_wifi="nmcli c"

alias luamake=/home/guilherme/.config/nvim/lua-language-server/3rd/luamake/luamake



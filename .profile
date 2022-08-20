## GUI config
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

## Default CLI Editor
export EDITOR=/usr/bin/nvim

## Rust Cargo
. "$HOME/.cargo/env"

## Local Visual Studio Code path
export PATH="$HOME/Softwares/VSCode-linux-x64/bin/:$PATH"

## FZF Default command (I think i'm not using FZF anymore but i'll keep it)
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

## Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

## Lua and Luarocks
if [[ -n "`which luarocks 2>/dev/null`" ]]; then
    eval `luarocks path --bin`
fi

alias luamake=$HOME/Softwares/lua-language-server/3rd/luamake/luamake

# Set Caps Lock as Ctrl
setxkbmap -option ctrl:nocaps

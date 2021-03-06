## GUI config
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

## Default CLI Editor
export EDITOR=/usr/bin/nvim

## Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

## Local Visual Studio Code path
export PATH="$HOME/Softwares/VSCode-linux-x64/bin/:$PATH"

## FZF Default command (I think i'm not using FZF anymore but i'll keep it)
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

## N Node version manager
export N_PREFIX=$HOME/.n
export PATH="$N_PREFIX/bin:$PATH"
export N_USE_XZ=1

## Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

## Luarocks
if [[ -n "`which luarocks 2>/dev/null`" ]]; then
    eval `luarocks path --bin`
fi

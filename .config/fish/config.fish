### Theme Kawasaki (https://github.com/hastinbe/theme-kawasaki)
## Enable the time to be displayed.
set -g theme_display_time yes
set -g theme_display_time_format '+%I:%M:%S'

## Disable playing the user's current group.
set -g theme_display_group no

## Hide the current directory read/write indicator.
set -g theme_display_rw no

## Color customization
set -g theme_color_virtualenv yellow
set -g __fish_git_prompt_color_dirtystate cyan
set -g __fish_git_prompt_color_untrackedfiles white

### Pyenv
## Run commented commands below only one time in fish
## Do not uncomment, this will lead to repeated .pyenv/bin in path leading to 'File name too long' error in sudo
# set -Ux PYENV_ROOT $HOME/.pyenv
# set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source
pyenv virtualenv-init - | source

### Nodenv
nodenv init - | source


### ~/.profile
# Configurations below are better placed in ~/.profile instead of here,
# setting them in ~/.profile makes their bins available in 'sh' commands called from other apps like nemo actions.
# Needs logout to work.

## Setup VSCode Path
# export PATH="/home/alef/Softwares/VSCode-linux-x64/bin/:$PATH"

## Rust Lang (rustup)
# export PATH="$HOME/.cargo/bin:$PATH


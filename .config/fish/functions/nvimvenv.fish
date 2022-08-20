# Autosource virtualenv; Workarround for nvim
function nvimvenv
  # Pyenv: Check if inside a pyenv virtualenv that has been activated automatically
  if test -e "$VIRTUAL_ENV"; and test -f "$VIRTUAL_ENV/bin/activate.fish"
     and string match -q -r "^$PYENV_ROOT/.*" "$VIRTUAL_ENV"
    source "$VIRTUAL_ENV/bin/activate.fish"
    command nvim $argv # Run nvim program, ignore functions, builtins and aliases
    deactivate
  # Poetry: Start nvim inside poetry env if poetry exists, if inside a poetry project, and no venv is already active
  else if test ! -e "$VIRTUAL_ENV"; and command -v poetry 1>/dev/null; and test -d (poetry env info -p) 2>/dev/null
    poetry run nvim $argv
  else
    command nvim $argv # Run nvim program, ignore functions, builtins and aliases
  end
end;

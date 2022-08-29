# Autosource virtualenv; Workarround for nvim

function nvimvenv
  # Pyenv
  # Check if inside a pyenv virtualenv that has been activated automatically
  if test -e "$VIRTUAL_ENV";
     and test -f "$VIRTUAL_ENV/bin/activate.fish"
     and string match -q -r "^$PYENV_ROOT/.*" "$VIRTUAL_ENV"
    source "$VIRTUAL_ENV/bin/activate.fish"
    # Run nvim program, ignore functions, builtins and aliases
    command nvim $argv
    deactivate
    return
  end;
  # Poetry: Start nvim inside poetry env if poetry exists, if inside a poetry
  # project, and no venv is already active
  if test ! -e "$VIRTUAL_ENV";
     and test -n "$(upfind pyproject.toml)";
     and command -v poetry 1>/dev/null;
     and test -d (poetry env info -p) 2>/dev/null
    poetry run nvim $argv
    return
  end
  command nvim $argv # Run nvim program, ignore functions, builtins and aliases
end;

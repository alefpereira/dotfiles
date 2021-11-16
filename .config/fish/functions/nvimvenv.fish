# Autosource virtualenv; Workarround for nvim
function nvimvenv
  if test -e "$VIRTUAL_ENV"; and test -f "$VIRTUAL_ENV/bin/activate.fish"
    source "$VIRTUAL_ENV/bin/activate.fish"
    command nvim $argv # Run nvim program, ignore functions, builtins and aliases
    deactivate
  else
    command nvim $argv # Run nvim program, ignore functions, builtins and aliases
  end
end;

# Autosource virtualenv; Workarround for nvim
function nvimvenv
  if test -e "$VIRTUAL_ENV"; and test -f "$VIRTUAL_ENV/bin/activate.fish"
    source "$VIRTUAL_ENV/bin/activate.fish"
    /usr/bin/nvim $argv # When using aliases its safer to use absolute path
    deactivate
  else
    /usr/bin/nvim $argv # When using aliases its safer to use absolute path
  end
end;

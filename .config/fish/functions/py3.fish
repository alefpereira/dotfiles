# Defined in /home/alef/.config/fish/functions/py3.fish @ line 2
function py3 --wraps='if ipython3 --version &> /dev/null; ipython3; else; python3; end;' --description 'alias py3=if ipython3 --version &> /dev/null; ipython3; else; python3; end;'
  if command -v ipython3 1> /dev/null; ipython3; else; python3; end;
end

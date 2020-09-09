# Defined in - @ line 1
function h --wraps='history -R | nl' --description 'alias h=history -R | nl'
  history -R | nl $argv;
end

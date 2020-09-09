# Defined in - @ line 1
function p --wraps='ping -s $argv | while read pong; echo (date "+%H:%M:%S") $pong; end;' --wraps='ping -s 16 $argv | while read pong; echo (date "+%H:%M:%S") $pong; end;' --description 'alias p=ping -s 16 $argv | while read pong; echo (date "+%H:%M:%S") $pong; end;'
  ping -s 16 $argv | while read pong; echo (date "+%H:%M:%S") $pong; end; 
end

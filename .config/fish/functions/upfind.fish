# Find file upwards
function upfind
  set CURRENT "$(pwd)"
  while true
      find $CURRENT -maxdepth 1 -name "$argv[1]"
      if [ $CURRENT = "/" ]
          break
      end
      set CURRENT $(dirname "$CURRENT")
  end
end;


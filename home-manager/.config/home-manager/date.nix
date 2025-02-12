{ pkgs }:

pkgs.writeTextFile {
  name = "notify-date";
  destination = "/bin/notify-date";
  executable = true;
  
  text = ''
  #!/bin/sh

  if [ "`timew`" = "There is no active time tracking." ]; then
    time_warrior="inactive"
  else
    time_warrior=`timew sum | tail -n2 | head -n1 | xargs | rev | cut -c4- | rev`
  fi
  
  notify-send "Info" " $(date '+%Y-%m-%d %R:%S')\n $time_warrior"
  '';
}

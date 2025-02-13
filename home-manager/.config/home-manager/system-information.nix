{ pkgs }:

pkgs.writeTextFile {
  name = "system-information";
  destination = "/bin/system-information";
  executable = true;
  
  text = ''
  #!/bin/sh

  if [ "`timew`" = "There is no active time tracking." ]; then
    time_warrior="inactive"
  else
    time_warrior=`timew sum | tail -n2 | head -n1 | xargs | rev | cut -c4- | rev`
  fi
  
  notify-send -i /usr/share/void-artwork/void-transparent.png "System Information" " $(date '+%Y-%m-%d %R:%S')\n $time_warrior"
  '';
}

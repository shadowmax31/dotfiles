{ pkgs }:

pkgs.writeTextFile {
  name = "notify";
  destination = "/bin/notify";
  executable = true;
  
  text = ''
  #!/bin/bash

  msg="$1"
  on="$2"
  
  echo "notify-send -t 0 'Custom Warning' '$msg'" | at $on
  '';
}

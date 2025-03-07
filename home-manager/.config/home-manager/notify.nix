{ pkgs }:

pkgs.writeTextFile {
  name = "notify";
  destination = "/bin/notify";
  executable = true;
  
  text = ''
  #!/bin/bash

  msg="$1"
  on="$2"
 
  echo "notify-send -i /usr/share/icons/Adwaita/scalable/devices/camera-web.svg 'Custom Warning' '$msg'; play -q /usr/share/sounds/freedesktop/stereo/bell.oga" | at $on
  '';
}

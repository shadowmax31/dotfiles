{ pkgs }:

pkgs.writeTextFile {
  name = "pwolf";
  destination = "/bin/pwolf";
  executable = true;
  
  text = ''
  #!/bin/sh
  
  librewolf --private-window
  '';
}

{ pkgs, filename, flatpakid }:

pkgs.writeTextFile {
  name = "${filename}";
  destination = "/bin/${filename}";
  executable = true;
  
  text = ''
  #!/bin/sh
  
  /var/lib/flatpak/exports/bin/${flatpakid}
  '';
}

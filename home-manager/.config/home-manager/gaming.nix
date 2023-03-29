{ pkgs, username }:

pkgs.writeTextFile {
  name = "gaming";
  destination = "/bin/gaming";
  executable = true;

  text = ''
  #!/bin/sh

  vm="win10"
  
  touch /dev/shm/looking-glass
  chmod 0660 /dev/shm/looking-glass
  chown ${username}:libvirt /dev/shm/looking-glass
  
  virsh start $vm
  
  sleep 5
  
  scream -i virbr0 &
  looking-glass-client
  
  pkill -P $$
  '';

}

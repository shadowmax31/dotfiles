{ pkgs }:

pkgs.writeTextFile {
  name = "be-shortcuts";
  destination = "/bin/be-shortcuts";
  executable = true;
  
  text = ''
  #!/bin/bash
  
  # TITLE     |command
  # ^^ .shortcuts format 
  selected=$($HOME/.shortcuts | awk NF | awk '{split($0,i,"|"); print i[1]}' | sort | bemenu -p 'Open:' --hf '#bd93f9')
  
  [[ -n $selected ]] || exit
  
  command=$($HOME/.shortcuts | grep "$selected" | awk '{split($0,i,"|"); print i[2]}')
  
  [[ -n $command ]] || exit
  
  eval "$command"
  '';
}

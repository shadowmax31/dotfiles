{ pkgs }:

pkgs.writeTextFile {
  name = "vpn";
  destination = "/bin/vpn";
  executable = true;
  
  text = ''
  #!/bin/bash
  
  conf="$1"
  
  if [ -z "$VPN_FILES" ]; then
    echo "Define the variable VPN_FILES"
    exit
  fi
  
  if [ -z "$conf" ]; then
    echo "Provide a filename from the following list:"
    ls $VPN_FILES
    exit
  fi
  
  new_config="$VPN_FILES/$conf"
  if [ ! -f "$new_config" ]; then
    echo "The configuration [$conf] does not exist. Use one of the following:"
    ls $VPN_FILES
    exit
  fi
  
  doas sv stop wireguard > /dev/null
  
  doas test -e "/etc/wireguard/vpn.conf" && doas rm /etc/wireguard/vpn.conf
  doas ln -s $new_config /etc/wireguard/vpn.conf
  
  doas sv start wireguard > /dev/null
  '';
}

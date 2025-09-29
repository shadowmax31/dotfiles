{ pkgs }:

pkgs.writeTextFile {
  name = "system-information";
  destination = "/bin/system-information";
  executable = true;
  
  text = ''
  #!/bin/sh

  title=""
  body=""
  if [ "$1" = "cal" ]; then
    today=$(date '+%-d')
    title=$(cal | head -n1 | awk '$1=$1')
	  body=$(cal | tail -n7 | sed -z "s|$today|<u><b>$today</b></u>|1")

  else
    if [ "`/opt/compiled/bin/timew`" = "There is no active time tracking." ]; then
      time_warrior="inactive"
    else
      time_warrior=`/opt/compiled/bin/timew sum | tail -n2 | head -n1 | xargs | rev | cut -c4- | rev`
    fi

    vpn_on=""
    vpn_off=""
    if [ -d /proc/sys/net/ipv4/conf/main ]; then
      ipv4="$vpn_on"
    else
      ipv4="$vpn_off"
    fi

    if [ -d /proc/sys/net/ipv6/conf/main ]; then
      ipv6="$vpn_on"
    else
      ipv6="$vpn_off"
    fi
    vpn='VPN -> '$ipv4' v4 / '$ipv6' v6'

    title="System Information"
    body=" $(date '+%Y-%m-%d %R:%S')\n $time_warrior\n $vpn"
  fi

  notify-send -i /usr/share/void-artwork/void-transparent.png \
    "$title" \
    "$body"
  
  '';
}

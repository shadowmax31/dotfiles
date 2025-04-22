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

    title="System Information"
    body=" $(date '+%Y-%m-%d %R:%S')\n $time_warrior"
  fi


  notify-send -i /usr/share/void-artwork/void-transparent.png \
    "$title" \
    "$body"
  
  '';
}

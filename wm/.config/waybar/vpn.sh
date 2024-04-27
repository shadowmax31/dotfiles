text=""
cls="red"

if [ -d /proc/sys/net/ipv4/conf/vpn ]; then
  text=""
  cls="safe"
fi

echo "{ \"text\": \""$text"\", \"class\": \"$cls\" }"

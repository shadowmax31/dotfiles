text=""
cls="red"

if [ -d /proc/sys/net/ipv4/conf/mtl ]; then
  text=""
  cls="normal"
fi

echo "{ \"text\": \""$text"\", \"class\": \"$cls\" }"

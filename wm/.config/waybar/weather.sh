#!/bin/sh

text=`curl -s "wttr.in?format=1"`

echo "{ \"text\": \""$text"\", \"class\": \"\" }"

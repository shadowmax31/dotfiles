#!/bin/sh

active=`timew`

if [ "$active" = "There is no active time tracking." ]; then
  text="inactive"
  cls="inactive"
else
  text=`timew sum | tail -n2 | head -n1 | xargs | rev | cut -c4- | rev`
fi

echo "{ \"text\": \""$text"\", \"class\": \"$cls\" }"

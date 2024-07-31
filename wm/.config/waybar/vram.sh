#!/bin/sh

used=`cat /sys/class/drm/card0/device/mem_info_vram_used`
total=`cat /sys/class/drm/card0/device/mem_info_vram_total`
percent=$(($used*100/$total))

echo "{ \"text\": \" "$percent"%\" }"

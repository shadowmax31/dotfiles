floating_modifier $mod
font pango:monospace 0

titlebar_padding 2
default_border pixel 3
default_floating_border none

gaps inner 4

client.focused #d8dee9 #d8dee9 #d8dee9 #d8dee9 #d8dee9
client.unfocused #4c566a #4c566a #4c566a #4c566a #4c566a

bar {
    swaybar_command waybar
}

# System
bindsym $mod+q kill
bindsym $mod+Shift+r reload
bindsym $mod+Shift+e exec "swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway?' -b 'Yes, exit sway' 'swaymsg exit'"

bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

bindsym $mod+w layout toggle split tabbed
bindsym $mod+e layout toggle split
bindsym $mod+f fullscreen

bindsym $mod+Shift+space floating toggle
bindsym $mod+Shift+c sticky toggle

bindsym $mod+space focus mode_toggle

mode "resize" {
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+d mode "resize"

# Audio control
bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%

# Lock Screen 
bindsym $mod+Shift+a exec swaylock \
        -i $main_output:~/.config/sway/wallpapers/w2.jpg \
        -i $side_output:~/.config/sway/wallpapers/w1.jpg

# Idle
exec swayidle -w \
	timeout 1800 'swaymsg "output * power off"' \
	resume 'swaymsg "output * power on"'

exec swayidle -w \
	timeout 30 'if pgrep -x swaylock; then swaymsg "output * power off"; fi' \
	resume 'swaymsg "output * power on"'

output $main_output bg ~/.config/sway/wallpapers/w2.jpg fill #282a36
output $side_output bg ~/.config/sway/wallpapers/w1.jpg fill #282a36

output $main_output position 1080 780 
output $side_output transform 270 
output $side_output position 0 2560

input "type:keyboard" {
 xkb_layout "us,ca(multix)"
 xkb_options "grp:sclk_toggle"
}

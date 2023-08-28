# Auto Start
exec corectrl

# Spawn Apps 
bindsym $mod+Return exec $terminal
bindsym $mod+s exec alacritty --class my_notes -e nb edit notes.md;
bindsym $mod+z exec alacritty --class my_pulsemixer -e pulsemixer

bindsym Print exec grim -g "$(slurp)" - | swappy -f -

bindsym $mod+r exec --no-startup-id bemenu-run -p 'Run:' 

bindsym $mod+p exec --no-startup-id passmenumore -p 'Password:' --hf '#ff79c6'
bindsym $mod+o exec --no-startup-id passmenumore --login -p 'Login:' --hf '#ffb86c'
bindsym $mod+i exec --no-startup-id passmenumore --otp -p 'OTP:' --hf '#ff5555'

# swaymsg -t get_tree
assign [class="StarUML"] workspace 3
assign [class="azuredatastudio"] workspace 5
assign [class="Brave-browser"] workspace 6
assign [class="Thunderbird"] workspace 8
assign [class="krita"] workspace 9
for_window [app_id="galculator"] floating enable
for_window [app_id="my_pulsemixer"] floating enable; move position center
for_window [app_id="my_notes"] floating enable; move position center

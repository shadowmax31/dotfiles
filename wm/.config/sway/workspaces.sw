# Define workspace
workspace 1 output $main_output
workspace 2 output $main_output
workspace 3 output $main_output
workspace 4 output $main_output
workspace 5 output $main_output
workspace 6 output $main_output
workspace 7 output $main_output
workspace 8 output $main_output
workspace 9 output $main_output
workspace 10 output $side_output

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+grave workspace 10

# One handed
bindsym $alt+Control+Shift+1 workspace 6
bindsym $alt+Control+Shift+2 workspace 7
bindsym $alt+Control+Shift+3 workspace 8
bindsym $alt+Control+Shift+4 workspace 9

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+grave move container to workspace 10

# Move workspace
bindsym $alt+l move workspace to right
bindsym $alt+h move workspace to left

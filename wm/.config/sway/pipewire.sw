exec dbus-update-activation-environment DISPLAY I3SOCK SWAYSOCK WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
exec pipewire 
exec pipewire-pulse
exec wireplumber
exec /usr/libexec/xdg-desktop-portal -r

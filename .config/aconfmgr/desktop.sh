# Hyprland
AddPackage hypridle # hyprland’s idle daemon
AddPackage hyprland # a highly customizable dynamic tiling Wayland compositor
AddPackage hyprlock # hyprland’s GPU-accelerated screen locking utility
AddPackage hyprwayland-scanner # A Hyprland implementation of wayland-scanner, in and for C++
AddPackage --foreign hyprpicker # A wlroots-compatible Wayland color picker that does not suck.

AddPackage --foreign aylurs-gtk-shell # Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system.
AddPackage swaync # A simple GTK based notification daemon for Sway

# Clipboard
AddPackage --foreign wl-clip-persist # Keep Wayland clipboard even after programs close
AddPackage --foreign clipse # A configurable TUI clipboard manager for Unix.

# XDG Desktop
AddPackage xdg-desktop-portal # Desktop integration portals for sandboxed apps
AddPackage xdg-desktop-portal-gtk # A backend implementation for xdg-desktop-portal using GTK
AddPackage xdg-desktop-portal-hyprland # xdg-desktop-portal backend for hyprland

# Polkit
AddPackage polkit-gnome # Legacy polkit authentication agent for GNOME

# QT
AddPackage qt5-wayland # Provides APIs for Wayland
AddPackage qt6-wayland # Provides APIs for Wayland

# Theme
AddPackage nwg-look # GTK3 settings editor adapted to work on wlroots-based compositors
AddPackage --foreign bibata-cursor-theme-bin # Material Based Cursor Theme
AddPackage --foreign orchis-theme # A Material Design theme for GNOME/GTK based desktop environments.
AddPackage --foreign qt5-styleplugins # Additional style plugins for Qt5
AddPackage --foreign tela-icon-theme # A flat colorful design icon theme.

# Wallpaper
AddPackage hyprpaper # a blazing fast wayland wallpaper utility with IPC controls
AddPackage swww # A Solution to your Wayland Wallpaper Woes
AddPackage --foreign mpvpaper # video wallpaper program for wlroots based wayland compositors

# Launcher
AddPackage --foreign nwg-drawer-bin # Application drawer for sway and other wlroots-based compositors

# Screenshot
AddPackage --foreign hyprshot # A utility to easily take screenshots in Hyprland using your mouse
AddPackage swappy # A Wayland native snapshot editing tool
AddPackage --foreign satty-bin # A screenshot annotation tool inspired by Swappy and Flameshot

# Xwayland
AddPackage xwaylandvideobridge # Utility to allow streaming Wayland windows to X applications

# Niri
AddPackage niri # A scrollable-tiling Wayland compositor

# Greeter
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage greetd # Generic greeter daemon
CopyFile /etc/greetd/config.toml
CopyFile /etc/greetd/niri.kdl
CopyFile /etc/greetd/quickshell.qml
CopyFile /etc/pam.d/greetd # For gnome-keyring

# Widget
AddPackage swaync # A simple GTK based notification daemon for Sway
AddPackage quickshell # Flexible toolkit for making desktop shells with QtQuick

# XDG Desktop
AddPackage dex # Program to generate and execute DesktopEntry files of type Application
AddPackage handlr-regex # Powerful alternative to xdg-utils written in Rust
AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment

# Polkit
AddPackage polkit-gnome # Legacy polkit authentication agent for GNOME

# IME
AddPackage fcitx5-configtool # Configuration Tool for Fcitx5
AddPackage fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
AddPackage --foreign fcitx5-mcbopomofo-git # McBopomofo for fcitx5
AddPackage --foreign fcitx5-theme-ayaya # pink style fcitx5 theme

# Clipboard
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wl-clip-persist # Keep Wayland clipboard even after programs close

# QT
AddPackage qt5-wayland # Provides APIs for Wayland
AddPackage qt6-wayland # Provides APIs for Wayland

# Theme
AddPackage qt5ct # Qt5 Configuration Utility
AddPackage qt6ct # Qt 6 Configuration Utility
AddPackage kvantum # SVG-based theme engine for Qt6 (including config tool and extra themes)
AddPackage kvantum-qt5 # SVG-based theme engine for Qt5
AddPackage --foreign kvantum-theme-orchis-git # Orchis theme for Kvantum
AddPackage nwg-look # GTK3 settings editor adapted to work on wlroots-based compositors
AddPackage orchis-theme # A Material Design theme for GNOME/GTK based desktop environments
AddPackage --foreign bibata-cursor-theme-bin # Material Based Cursor Theme
AddPackage --foreign matugen-bin # A material you color generation tool with templates
AddPackage --foreign tela-icon-theme # A flat colorful design icon theme.

# Wallpaper
AddPackage swaybg # Wallpaper tool for Wayland compositors
AddPackage swww # A Solution to your Wayland Wallpaper Woes
AddPackage --foreign linux-wallpaperengine-git # use steam's wallpaperengine on linux

# Launcher
AddPackage nwg-drawer # Application drawer for sway and other wlroots-based compositors

# Xwayland
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage xorg-xeyes # Follow the mouse/SHAPE extension X demo

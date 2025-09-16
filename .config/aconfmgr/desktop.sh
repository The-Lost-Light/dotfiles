# Compositor
AddPackage niri # A scrollable-tiling Wayland compositor

# Greeter
AddPackage greetd # Generic greeter daemon
CopyFile /etc/greetd/config.toml
CopyFile /etc/greetd/login.png
CopyFile /etc/greetd/niri.kdl
CopyFile /etc/greetd/quickshell.qml
CopyFile /etc/pam.d/greetd # For gnome-keyring

# Encryption
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage pantheon-polkit-agent # Pantheon Polkit Agent
AddPackage seahorse # GNOME application for managing PGP keys

# Widget
AddPackage quickshell # Flexible toolkit for making desktop shells with QtQuick
AddPackage swaync # A simple GTK based notification daemon for Sway
AddPackage --foreign bongocat # A Wayland overlay that displays an animated bongo cat reacting to keyboard input

# Filter
AddPackage --foreign sunsetr-bin # Automatic blue light filter for Hyprland, Niri, and everything Wayland (pre-compiled binary)

# XDG Desktop
AddPackage dex # Program to generate and execute DesktopEntry files of type Application
AddPackage handlr-regex # Powerful alternative to xdg-utils written in Rust
AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment
AddPackage --foreign pinapp-git # Create your own application shortcuts

# IME
AddPackage fcitx5-configtool # Configuration Tool for Fcitx5
AddPackage fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
AddPackage --foreign fcitx5-mcbopomofo-git # McBopomofo for fcitx5
AddPackage --foreign fcitx5-theme-ayaya # pink style fcitx5 theme
AddPackage gnome-characters # A character map application
AddPackage gucharmap # Gnome Unicode Charmap

# Clipboard
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wl-clip-persist # Keep Wayland clipboard even after programs close

# QT
AddPackage qt5-wayland # Provides APIs for Wayland
AddPackage qt6-wayland # Provides APIs for Wayland

# Theme engine
AddPackage qt5ct # Qt5 Configuration Utility
AddPackage qt6ct # Qt 6 Configuration Utility
AddPackage kvantum # SVG-based theme engine for Qt6 (including config tool and extra themes)
AddPackage kvantum-qt5 # SVG-based theme engine for Qt5
AddPackage nwg-look # GTK3 settings editor adapted to work on wlroots-based compositors
# Theme
AddPackage adw-gtk-theme # Unofficial GTK 3 port of the libadwaita theme
AddPackage --foreign bibata-cursor-theme-bin # Material Based Cursor Theme
AddPackage --foreign plasma6-themes-colloid-git # colloid theme for KDE Plasma
AddPackage --foreign tela-icon-theme # A flat colorful design icon theme.

# Wallpaper
AddPackage swaybg # Wallpaper tool for Wayland compositors
AddPackage swww # A Solution to your Wayland Wallpaper Woes
AddPackage --foreign gowall # A tool to convert a Wallpaper's color scheme - palette

# Launcher
AddPackage nwg-drawer # Application drawer for sway and other wlroots-based compositors

# Xwayland
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage xorg-xeyes # Follow the mouse/SHAPE extension X demo

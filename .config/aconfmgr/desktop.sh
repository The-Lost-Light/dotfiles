# Compositor
AddPackage niri # A scrollable-tiling Wayland compositor

# Noctalia
AddPackage noctalia # Lightweight Wayland shell built directly on Wayland and OpenGL ES

# Greeter
AddPackage --foreign noctalia-greeter # Minimal greetd login greeter with a bundled wlroots compositor
CopyFile /etc/greetd/config.toml
CopyFile /etc/pam.d/greetd

# Encryption
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage seahorse # GNOME application for managing PGP keys

# Filter
AddPackage --foreign sunsetr-bin # Automatic blue light filter for Hyprland, Niri, and everything Wayland (pre-compiled binary)

# XDG Desktop
AddPackage dex # Program to generate and execute DesktopEntry files of type Application
AddPackage handlr-regex # Powerful alternative to xdg-utils written in Rust
AddPackage xdg-desktop-portal-gnome # Backend implementation for xdg-desktop-portal for the GNOME desktop environment
AddPackage --foreign pins # Create your own application shortcuts

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

# Xwayland
AddPackage xwayland-satellite # Xwayland outside your Wayland
AddPackage xorg-xeyes # Follow the mouse/SHAPE extension X demo

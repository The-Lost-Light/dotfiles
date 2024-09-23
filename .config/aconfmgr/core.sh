# Boot
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
CopyFile /etc/booster.yaml
CopyFile /etc/modprobe.d/nvidia.conf
CopyFile /etc/modules-load.d/droidcam.conf

# Base
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages

# File System
AddPackage btrfs-progs # Btrfs filesystem utilities
CopyFile /etc/fstab

# Zram
AddPackage zram-generator # Systemd unit generator for zram devices
CopyFile /etc/sysctl.d/99-vm-zram-parameters.conf
CopyFile /etc/systemd/zram-generator.conf

# Firmware
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage linux-firmware # Firmware files for Linux

# Audio
AddPackage easyeffects # Audio Effects for Pipewire applications
AddPackage pamixer # Pulseaudio command-line mixer like amixer
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage --foreign pwvucontrol # Pipewire volume control for GNOME

# Bluetooth
AddPackage blueman # GTK+ Bluetooth Manager
AddPackage gnome-bluetooth-3.0 # GNOME Bluetooth Subsystem
AddPackage --foreign overskride-bin # A simple yet powerful bluetooth client (binary release)

# Network
AddPackage network-manager-applet # Applet for managing network connections
AddPackage networkmanager # Network connection manager and user applications
CopyFile /etc/NetworkManager/conf.d/wifi-powersave.conf

# Font
AddPackage noto-fonts # Google Noto TTF fonts
AddPackage noto-fonts-cjk # Google Noto CJK fonts
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage noto-fonts-extra # Google Noto TTF fonts - additional variants
AddPackage ttf-firacode-nerd # Patched font Fira (Fura) Code from nerd fonts library
AddPackage ttf-iosevka-nerd # Patched font Iosevka from nerd fonts library
AddPackage ttf-jetbrains-mono-nerd # Patched font JetBrains Mono from nerd fonts library
AddPackage ttf-nerd-fonts-symbols-mono # High number of extra glyphs from popular 'iconic fonts' (monospace)
AddPackage wqy-zenhei # A Hei Ti Style (sans-serif) Chinese Outline Font.
AddPackage --foreign ttc-monocraft # A programming font based on the typeface used in Minecraft
AddPackage --foreign ttf-ubraille # Unicode Braillt font

# Power
AddPackage power-profiles-daemon # Makes power profiles handling available over D-Bus
AddPackage --foreign ryzenadj # RyzenAdj tool for adjusting Ryzen Mobile power states
CopyFile /etc/systemd/logind.conf

# Keyring
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage greetd # Generic greeter daemon
CopyFile /etc/greetd/config.toml
CopyFile /etc/pam.d/greetd # For gnome-keyring

# Shell
AddPackage dash # POSIX compliant shell that aims to be as small as possible
AddPackage fish # Smart and user friendly shell intended mostly for interactive use
AddPackage nushell # A new type of shell
# Shell tools
AddPackage bat # Cat clone with syntax highlighting and git integration
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage fzf # Command-line fuzzy finder
AddPackage lsd # Modern ls with a lot of pretty colors and awesome icons
AddPackage repgrep # An interactive command line replacer for ripgrep
AddPackage ripgrep-all # rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.
AddPackage starship # The cross-shell prompt for astronauts
AddPackage zoxide # A smarter cd command for your terminal

# Pacman
CopyFile /etc/makepkg.conf
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/hooks/nvidia.hook
CopyFile /etc/pacman.d/hooks/spicetify.hook
CopyFile /etc/xdg/reflector/reflector.conf

# Backup
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage timeshift # A system restore utility for Linux
AddPackage xorg-xhost # Server access control program for X
AddPackage --foreign timeshift-autosnap # Timeshift auto-snapshot script which runs before package upgrade using Pacman hook.
CopyFile /etc/cron.d/timeshift-boot
CopyFile /etc/cron.d/timeshift-hourly
CopyFile /etc/timeshift/timeshift.json

# Fcitx5
AddPackage fcitx5-configtool # Configuration Tool for Fcitx5
AddPackage fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
AddPackage fcitx5-mozc # Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)
AddPackage --foreign fcitx5-mcbopomofo-git # McBopomofo for fcitx5

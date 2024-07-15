# Boot
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage acpi_call-dkms # A linux kernel module that enables calls to ACPI methods through /proc/acpi/call - module sources
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
AddPackage pavucontrol # PulseAudio Volume Control
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement

# Bluetooth
AddPackage blueman # GTK+ Bluetooth Manager
AddPackage gnome-bluetooth-3.0 # GNOME Bluetooth Subsystem
AddPackage --foreign bt-dualboot # Sync Bluetooth for dualboot Linux and Windows
AddPackage --foreign overskride # A simple yet powerful bluetooth client

# Network
AddPackage network-manager-applet # Applet for managing network connections
AddPackage networkmanager # Network connection manager and user applications
CopyFile /etc/NetworkManager/conf.d/wifi-powersave.conf

# Font
AddPackage noto-fonts # Google Noto TTF fonts
AddPackage noto-fonts-cjk # Google Noto CJK fonts
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage noto-fonts-extra # Google Noto TTF fonts - additional variants
AddPackage otf-monaspace-nerd # Patched font Monaspace (Monaspice) from nerd fonts library
AddPackage ttf-firacode-nerd # Patched font Fira (Fura) Code from nerd fonts library
AddPackage ttf-iosevka-nerd # Patched font Iosevka from nerd fonts library
AddPackage ttf-jetbrains-mono-nerd # Patched font JetBrains Mono from nerd fonts library
AddPackage ttf-nerd-fonts-symbols-mono # High number of extra glyphs from popular 'iconic fonts' (monospace)
AddPackage wqy-zenhei # A Hei Ti Style (sans-serif) Chinese Outline Font.
AddPackage --foreign otf-monocraft # A programming font based on the typeface used in Minecraft
AddPackage --foreign ttf-ubraille # Unicode Braillt font

# Power
AddPackage power-profiles-daemon # Makes power profiles handling available over D-Bus
AddPackage --foreign ryzenadj-git # RyzenAdj tool for adjusting Ryzen Mobile power states
CopyFile /etc/systemd/logind.conf

# Greetd
AddPackage greetd # Generic greeter daemon
CopyFile /etc/greetd/config.toml
CopyFile /etc/greetd/greeter.js
CopyFile /etc/greetd/hyprland.conf
CopyFile /etc/greetd/hyprpaper.conf
CopyFile /etc/greetd/login.png

# Shell
AddPackage dash # POSIX compliant shell that aims to be as small as possible
AddPackage fish # Smart and user friendly shell intended mostly for interactive use

# Pacman
CopyFile /etc/makepkg.conf
AddPackage reflector # A Python 3 module and script to retrieve and filter the latest Pacman mirror list.
AddPackage --foreign paru # Feature packed AUR helper
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
AddPackage --foreign downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/hooks/nvidia.hook
CopyFile /etc/pacman.d/hooks/spicetify.hook
CopyFile /etc/xdg/reflector/reflector.conf

# Backup
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage timeshift # A system restore utility for Linux
AddPackage --foreign timeshift-autosnap # Timeshift auto-snapshot script which runs before package upgrade using Pacman hook.
CopyFile /etc/cron.d/timeshift-boot
CopyFile /etc/cron.d/timeshift-hourly
CopyFile /etc/timeshift/timeshift.json

# Fcitx5
AddPackage fcitx5-configtool # Configuration Tool for Fcitx5
AddPackage fcitx5-gtk # Fcitx5 gtk im module and glib based dbus client library
AddPackage fcitx5-mozc # Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)
AddPackage --foreign fcitx5-mcbopomofo-git # McBopomofo for fcitx5

# System Configure
CopyFile /etc/adjtime
CopyFile /etc/hostname
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Asia/Taipei

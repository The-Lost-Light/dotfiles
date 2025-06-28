# Boot
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage linux-cachyos # The Linux BORE + LTO + Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules
AddPackage linux-cachyos-headers # Headers and scripts for building modules for the Linux BORE + LTO + Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel
CopyFile /etc/booster.yaml

# Base
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages

# File System
AddPackage 7zip # File archiver for extremely high compression
AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage trash-cli # Command line trashcan (recycle bin) interface
CopyFile /etc/fstab

# Firmware
AddPackage fwupd # Simple daemon to allow session software to update firmware
CopyFile /etc/fwupd/remotes.d/lvfs-testing.conf
CopyFile /etc/fwupd/remotes.d/lvfs.conf
AddPackage linux-firmware # Firmware files for Linux

# Audio
AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities
AddPackage easyeffects # Audio Effects for Pipewire applications
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage realtime-privileges # Realtime privileges for users
AddPackage --foreign sonusmix # Next-gen Pipewire audio routing tool
AddPackage --foreign pwvucontrol # Pipewire volume control for GNOME

# Network
AddPackage network-manager-applet # Applet for managing network connections
AddPackage networkmanager # Network connection manager and user applications
CopyFile /etc/NetworkManager/conf.d/wifi-powersave.conf

# Bluetooth
AddPackage blueman # GTK+ Bluetooth Manager
AddPackage gnome-bluetooth-3.0 # GNOME Bluetooth Subsystem
AddPackage --foreign overskride-bin # A simple yet powerful bluetooth client (binary release)

# Pacman
AddPackage downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage lostfiles # Find orphaned files not owned by any Arch packages
AddPackage rebuild-detector # Detects which packages need to be rebuilt
AddPackage yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
CopyFile /etc/makepkg.conf
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/hooks/spicetify.hook
# CachyOS
AddPackage cachyos-keyring # CachyOS keyring
AddPackage cachyos-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-v3-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-v4-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-rate-mirrors # CachyOS - Rate mirrors service

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

# Settings
AddPackage cachyos-settings # CachyOS - Settings
# Power
AddPackage power-profiles-daemon # Makes power profiles handling available over D-Bus
AddPackage --foreign ryzenadj # RyzenAdj tool for adjusting Ryzen Mobile power states
CopyFile /etc/systemd/logind.conf
# Zram
CopyFile /etc/sysctl.d/99-vm-zram-parameters.conf

# Backup
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage timeshift # A system restore utility for Linux
AddPackage xorg-xhost # Server access control program for X
AddPackage --foreign timeshift-autosnap # Timeshift auto-snapshot script which runs before package upgrade using Pacman hook.
CopyFile /etc/cron.d/timeshift-boot
CopyFile /etc/cron.d/timeshift-hourly
CopyFile /etc/timeshift/timeshift.json

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

# Wine
AddPackage wine-staging # A compatibility layer for running Windows programs - Staging branch
AddPackage wine-gecko # Wine's built-in replacement for Microsoft's Internet Explorer
AddPackage wine-mono # Wine's built-in replacement for Microsoft's .NET Framework
AddPackage winetricks # Script to install various redistributable runtime libraries in Wine.
AddPackage lib32-gnutls # A library which provides a secure layer over a reliable transport layer (32-bit)
AddPackage lib32-sdl2-compat # An SDL2 compatibility layer that uses SDL3 behind the scenes - 32-bit
AddPackage lib32-pipewire # Low-latency audio/video router and processor - 32-bit
AddPackage samba # SMB Fileserver and AD Domain server

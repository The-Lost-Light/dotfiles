# Boot
AddPackage amd-ucode # Microcode update image for AMD CPUs
AddPackage booster # Fast and secure initramfs generator
CopyFile /etc/booster.yaml
AddPackage linux-cachyos # The Linux BORE + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel and modules
AddPackage linux-cachyos-headers # Headers and scripts for building modules for the Linux BORE + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel
AddPackage --foreign preloader-signed # Linux Foundation UEFI secure boot system (prebuilt X64 EFI binaries)
AddPackage --foreign refi2nd # A fork of rEFInd with bug-fixes and optimizations.
CopyFile /boot/refind_linux.conf

# Base
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
CopyFile /etc/adjtime
CopyFile /etc/locale.gen
CopyFile /etc/locale.conf
CreateLink /etc/localtime ../usr/share/zoneinfo/Asia/Taipei

# File System
AddPackage 7zip # File archiver for extremely high compression
AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage btrfs-assistant # An application for managing BTRFS subvolumes and Snapper snapshots
AddPackage trash-cli # Command line trashcan (recycle bin) interface

## Device
# Firmware
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage linux-firmware # Firmware files for Linux
# CPU
AddPackage cpupower-gui # A GUI utility to set CPU frequency limits
# Audio
AddPackage alsa-utils # Advanced Linux Sound Architecture - Utilities
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-alsa # Low-latency audio/video router and processor - ALSA configuration
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage realtime-privileges # Realtime privileges for users
# Monitor
AddPackage ddcutil # Query and change Linux monitor settings using DDC/CI and USB.
AddPackage --foreign brightnessctl-git # Lightweight brightness control tool
# Network
AddPackage networkmanager # Network connection manager and user applications
AddPackage network-manager-applet # Applet for managing network connections
AddPackage --foreign nmgui-bin # GTK4-based GUI for NetworkManager (nmcli) — binary release
CopyFile /etc/NetworkManager/conf.d/wifi-powersave.conf
# Bluetooth
AddPackage blueman # GTK+ Bluetooth Manager
AddPackage --foreign overskride-bin # A simple yet powerful bluetooth client (binary release)
# Others
AddPackage openrgb # Open source RGB lighting control that doesn't depend on manufacturer software

# Pacman
AddPackage downgrade # Bash script for downgrading one or more packages to a version in your cache or the A.L.A.
AddPackage lostfiles # Find orphaned files not owned by any Arch packages
AddPackage rebuild-detector # Detects which packages need to be rebuilt
AddPackage yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.
CopyFile /etc/makepkg.conf
CopyFile /etc/pacman.conf
# CachyOS
AddPackage cachyos-keyring # CachyOS keyring
AddPackage cachyos-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-v3-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-v4-mirrorlist # CachyOS repository mirrorlist
AddPackage cachyos-rate-mirrors # CachyOS - Rate mirrors service

# Shell
AddPackage nushell # A new type of shell
AddPackage --foreign dashbinsh # Relink /bin/sh to dash
AddPackage --foreign carapace-bin # multi-shell multi-command argument completer
CopyFile /etc/shells
# Shell tools
AddPackage bat # Cat clone with syntax highlighting and git integration
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage fzf # Command-line fuzzy finder
AddPackage lsd # Modern ls with a lot of pretty colors and awesome icons
AddPackage repgrep # An interactive command line replacer for ripgrep
AddPackage ripgrep-all # rga: ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.
AddPackage starship # The cross-shell prompt for astronauts
AddPackage zoxide # A smarter cd command for your terminal
AddPackage --foreign kotofetch # Minimalist fetch tool for Japanese quotes (written in Rust)

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
AddPackage cachyos-snapper-support # CachyOS package that handles snapper configs.

# Font
AddPackage noto-fonts # Google Noto TTF fonts
AddPackage noto-fonts-cjk # Google Noto CJK fonts
AddPackage noto-fonts-emoji # Google Noto emoji fonts
AddPackage noto-fonts-extra # Google Noto TTF fonts - additional variants
AddPackage ttf-firacode-nerd # Patched font Fira (Fura) Code from nerd fonts library
AddPackage ttf-jetbrains-mono-nerd # Patched font JetBrains Mono from nerd fonts library
AddPackage ttf-nerd-fonts-symbols-mono # High number of extra glyphs from popular 'iconic fonts' (monospace)
AddPackage wqy-zenhei # A Hei Ti Style (sans-serif) Chinese Outline Font.
AddPackage --foreign maplemono-nf-cn-unhinted # Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line
AddPackage --foreign ttf-lucide-font # Beautiful & consistent icon toolkit made by the community.
AddPackage --foreign ttf-material-symbols-variable-git # Material Design icons by Google - variable fonts
AddPackage --foreign ttc-monocraft # A programming font based on the typeface used in Minecraft
AddPackage --foreign ttf-ubraille # Unicode Braillt font

# Wine
AddPackage wine-staging # A compatibility layer for running Windows programs - Staging branch
AddPackage wine-gecko # Wine's built-in replacement for Microsoft's Internet Explorer
AddPackage wine-mono # Wine's built-in replacement for Microsoft's .NET Framework
AddPackage winetricks # Script to install various redistributable runtime libraries in Wine.

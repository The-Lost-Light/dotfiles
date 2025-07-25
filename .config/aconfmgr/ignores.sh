IgnorePath "/usr/*"
IgnorePath "/var/*"
IgnorePath "/opt/*"

# Timeshift
IgnorePath "/timeshift-btrfs/*"
# Nix
IgnorePath "/nix/*"
# Cache Files
IgnorePath "*.cache"

# ESP
IgnorePath "/boot/*"
IgnorePath "/etc/.*"
IgnorePath "/efi/FSCK*.REC"
IgnorePath "/efi/EFI/tools"
IgnorePath "/efi/System\ Volume\ Information"
IgnorePath "/efi/EFI/Boot/*"
IgnorePath "/efi/EFI/Microsoft/*"
IgnorePath "/efi/EFI/Arch/*.img"
IgnorePath "/efi/EFI/Arch/vmlinuz-linux*"

## ETC
IgnorePath "/etc/ca-certificates/*"
IgnorePath "/etc/fonts/*"
IgnorePath "/etc/spotify-launcher.conf"
# Network
IgnorePath "/etc/NetworkManager/system-connections/*"
# Pacman
IgnorePath "/etc/pacman.d/gnupg/*"
IgnorePath "/etc/pacman.d/*mirrorlist*"
# SSH
IgnorePath "/etc/ssh/*"
IgnorePath "/etc/ssl/*"
# Systemd
IgnorePath "/etc/systemd/system/*"
IgnorePath "/etc/systemd/user/*"
IgnorePath "/etc/vconsole.conf"
# Tailscale
IgnorePath "/etc/resolv.conf"
IgnorePath "/etc/resolv.pre-tailscale-backup.conf"
# System File
IgnorePath "/etc/cni/net.d"
IgnorePath "/etc/group"
IgnorePath "/etc/gshadow"
IgnorePath "/etc/hostname"
IgnorePath "/etc/locale.gen"
IgnorePath "/etc/machine-id"
IgnorePath "/etc/os-release"
IgnorePath "/etc/passwd*"
IgnorePath "/etc/shadow"
IgnorePath "/etc/shells"
IgnorePath "/etc/subgid"
IgnorePath "/etc/subuid"
IgnorePath "/etc/sudoers*"
IgnorePath "/etc/xml"
IgnorePath "/etc/*-"

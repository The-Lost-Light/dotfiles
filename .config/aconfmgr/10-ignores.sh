IgnorePath "/usr/*"
IgnorePath "/var/*"
IgnorePath "/opt/*"

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

# Timeshift
IgnorePath "/timeshift-btrfs/*"

# ETC
IgnorePath "/etc/asusd/*"
IgnorePath "/etc/ca-certificates/*"
IgnorePath "/etc/fonts/*"
IgnorePath "/etc/supergfxd.conf"
IgnorePath "/etc/modprobe.d/supergfxd.conf"
IgnorePath "/etc/NetworkManager/system-connections/*"
IgnorePath "/etc/pacman.d/gnupg/*"
IgnorePath "/etc/pacman.d/mirrorlist"
IgnorePath "/etc/spotify-launcher.conf"
IgnorePath "/etc/ssh/*"
IgnorePath "/etc/ssl/*"
IgnorePath "/etc/systemd/system/*"
IgnorePath "/etc/systemd/user/*"
IgnorePath "/etc/vconsole.conf"
# System Auto Generate
IgnorePath "/etc/group"
IgnorePath "/etc/group-"
IgnorePath "/etc/gshadow"
IgnorePath "/etc/gshadow-"
IgnorePath "/etc/passwd"
IgnorePath "/etc/passwd-"
IgnorePath "/etc/machine-id"
IgnorePath "/etc/os-release"
IgnorePath "/etc/cni/net.d"
IgnorePath "/etc/shadow"
IgnorePath "/etc/shadow-"
IgnorePath "/etc/shells"
IgnorePath "/etc/subgid"
IgnorePath "/etc/subgid-"
IgnorePath "/etc/subuid"
IgnorePath "/etc/subuid-"
IgnorePath "/etc/sudoers"
# tailscale
IgnorePath "/etc/resolv.conf"
IgnorePath "/etc/resolv.pre-tailscale-backup.conf"


# Cache Files
IgnorePath "*.cache"

IgnorePath "*.cache"
IgnorePath "*.lock"
IgnorePath "*-" # Backup files


IgnorePath "/usr/*"
IgnorePath "/var/*"
IgnorePath "/opt/*"
IgnorePath "/.snapshots/*"

# Boot
IgnorePath "/boot/vmlinuz-linux*"
IgnorePath "/boot/*.img"
IgnorePath "/efi"

## ETC
IgnorePath "/etc/ca-certificates/*" # Certificates
IgnorePath "/etc/fonts/conf.d/*" # Font configurations
IgnorePath "/etc/fwupd/*" # Firmware
IgnorePath "/etc/NetworkManager/system-connections/*" # Saved connected network
IgnorePath "/etc/xml" # XML Catalog
IgnorePath "/etc/audisp" # Audit event dispatcher
IgnorePath "/etc/audit" # Audit configuration
# Pacman
IgnorePath "/etc/pacman.d/gnupg/*" # GPG
IgnorePath "/etc/pacman.d/*mirrorlist*" # Mirrorlist
# SSH
IgnorePath "/etc/ssh/*"
IgnorePath "/etc/ssl/*"
# Systemd
IgnorePath "/etc/systemd/system/*"
IgnorePath "/etc/systemd/user/*"
IgnorePath "/etc/userdb" # User database
IgnorePath "/etc/.updated" # System update status
IgnorePath "/etc/resolv.conf" # Tailscale DNS
# Groups and Passwords
IgnorePath "/etc/group" # Group database
IgnorePath "/etc/gshadow" # Shadowed group database
IgnorePath "/etc/passwd" # User database
IgnorePath "/etc/shadow" # Shadowed user database
# Unique machine identifiers
IgnorePath "/etc/machine-id" # Machine ID
IgnorePath "/etc/hostname" # Hostname
IgnorePath "/etc/os-release" # OS Release
IgnorePath "/etc/subgid" # Subordinate group IDs
IgnorePath "/etc/subuid" # Subordinate user IDs
IgnorePath "/etc/fstab" # File systems

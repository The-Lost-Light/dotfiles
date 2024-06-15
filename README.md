# TODO
- [ ]waybar->ags
- [ ]swaync->ags
- [ ]swaylock->hyprlock
- [ ]swayidle->hypridle
- [ ]hyprcursor

# Dependences
- fish
- pacman-contrib
- brightnessctl
- rsync

<details>
<summary>pre-commit git hook</summary>
```sh
#!/usr/bin/env sh

file_paths="
/efi/EFI/refind/refind.conf
/efi/EFI/refind/themes/refind-ambience
/efi/EFI/Arch/refind_linux.conf
/etc/fstab
/etc/makepkg.conf
/etc/pacman.conf
/etc/pacman.d/hooks
/etc/modprobe.d/nvidia.conf
/etc/booster.yaml
/etc/systemd/zram-generator.conf
/etc/sysctl.d/99-vm-zram-parameters.conf
/etc/sddm.conf.d/default.conf
/usr/share/sddm/themes/mono
"
printf "%s\n" $file_paths | while read -r file_path; do
	mkdir -p ~/root${file_path%/*}
	rsync -r --delete $file_path ~/root${file_path%/*}
done

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add ~/root
```
</details>

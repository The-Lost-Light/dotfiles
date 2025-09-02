$env.path ++= ["~/.cargo/bin"]

# Desktop
$env.LANG = "zh_TW.UTF-8"
$env.ELECTRON_OZONE_PLATFORM_HINT = "auto"
$env.ZED_WINDOW_DECORATIONS = "server"
$env.QT_QPA_PLATFORMTHEME = "qt6ct"
$env.XCURSOR_THEME = "Bibata-Modern-Ice"

# SSH
$env.SSH_AUTH_SOCK =  $"($env.XDG_RUNTIME_DIR)/ssh-agent.socket"

# Hardware Video Acceleration
$env.LIBVA_DRIVER_NAME = "radeonsi"
$env.VDPAU_DRIVER = "radeonsi"

# Vulkan
$env.MESA_VK_DEVICE_SELECT = "0x1002:0x1636"

# CUDA
$env.NVD_GPU = "0"
$env.XLA_FLAGS = "--xla_gpu_cuda_data_dir=/opt/cuda"

# Fcitx5
$env.XMODIFIERS = "@im=fcitx"
$env.QT_IM_MODULES = "wayland;fcitx;ibus"
$env.QT_IM_MODULE = "fcitx"

# Sccache
$env.RUSTC_WRAPPER = "sccache"

# Editor
$env.VISUAL = "helix"
$env.EDITOR = "helix"
$env.DIFFPROG = "helix"

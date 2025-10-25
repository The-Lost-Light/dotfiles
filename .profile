# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Desktop
export LANG="zh_TW.UTF-8"
export ELECTRON_OZONE_PLATFORM_HINT="auto"
export ZED_WINDOW_DECORATIONS="server"
export QT_QPA_PLATFORMTHEME="qt6ct"
export XCURSOR_THEME="Bibata-Modern-Ice"

# SSH
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# Hardware Video Acceleration
export LIBVA_DRIVER_NAME="radeonsi"
export VDPAU_DRIVER="radeonsi"

# Vulkan
export MESA_VK_DEVICE_SELECT="0x1002:0x1636"

# CUDA
export NVD_GPU="0"
export XLA_FLAGS="--xla_gpu_cuda_data_dir=/opt/cuda"

# Fcitx5
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULES="wayland;fcitx;ibus"
export QT_IM_MODULE="fcitx"

# Sccache
export RUSTC_WRAPPER="sccache"

# Editor
export VISUAL="helix"
export EDITOR="helix"
export DIFFPROG="helix"


# Hardware Video Acceleration
AddPackage libva # Video Acceleration (VA) API for Linux
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
AddPackage mesa # Open-source OpenGL drivers
AddPackage mesa-utils # Essential Mesa utilities
AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device
AddPackage vulkan-mesa-layers # Mesa's Vulkan layers

#NVIDIA
AddPackage cuda # NVIDIA's GPU programming toolkit
AddPackage cudnn # NVIDIA CUDA Deep Neural Network library
AddPackage libva-nvidia-driver # VA-API implementation that uses NVDEC as a backend
AddPackage nvidia-open-dkms # NVIDIA open kernel modules
AddPackage nvidia-prime # NVIDIA Prime Render Offload configuration and utilities
AddPackage nvtop # GPUs process monitoring for AMD, Intel and NVIDIA
CopyFile /etc/pacman.d/hooks/nvidia.hook

# AMD
AddPackage vulkan-radeon # Open-source Vulkan driver for AMD GPUs

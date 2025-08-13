# Hardware Video Acceleration
AddPackage libva # Video Acceleration (VA) API for Linux
AddPackage libva-utils # Intel VA-API Media Applications and Scripts for libva
AddPackage mesa # Open-source OpenGL drivers
AddPackage mesa-utils # Essential Mesa utilities
AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device
AddPackage vulkan-mesa-layers # Mesa's Vulkan layers

#NVIDIA
AddPackage linux-cachyos-nvidia # nvidia module of 580.76.05 driver for the linux-cachyos kernel
AddPackage nvidia-utils # NVIDIA drivers utilities
AddPackage nvidia-prime # NVIDIA Prime Render Offload configuration and utilities
AddPackage libva-nvidia-driver # VA-API implementation that uses NVDEC as a backend
AddPackage lib32-nvidia-utils # NVIDIA drivers utilities (32-bit)
AddPackage cuda # NVIDIA's GPU programming toolkit
AddPackage cudnn # NVIDIA CUDA Deep Neural Network library
AddPackage nvtop # GPUs process monitoring for AMD, Intel and NVIDIA

# AMD
AddPackage vulkan-radeon # Open-source Vulkan driver for AMD GPUs
AddPackage lib32-vulkan-radeon # Open-source Vulkan driver for AMD GPUs - 32-bit

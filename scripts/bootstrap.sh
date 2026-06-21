#!/bin/bash
# ImbriumOS Bootstrap - AI + Dev Linux Flavor
# Run on target Ubuntu or build host

set -e

echo "=== ImbriumOS Bootstrap Starting ==="

# Update system
sudo apt update && sudo apt upgrade -y

# Essential build & dev tools
sudo apt install -y build-essential git curl wget \
    linux-headers-generic dkms \
    python3 python3-pip python3-venv \
    docker.io docker-compose \
    vim neovim curl git htop btop \
    mesa-utils vulkan-tools

# GPU Detection & Setup (broad compat)
echo "Detecting hardware for AI acceleration..."
if lspci | grep -i nvidia; then
    echo "NVIDIA detected - installing CUDA support"
    sudo apt install -y nvidia-driver-550 nvidia-cuda-toolkit  # Adjust version as needed
elif lspci | grep -i amd; then
    echo "AMD detected - ROCm setup"
    # Add ROCm repo if needed
else
    echo "Using CPU fallback / Intel"
fi

# AI & ML Core
pip3 install --upgrade pip
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu  # CPU safe first
pip3 install ollama jupyterlab

# Dev Tools
sudo apt install -y rustup golang-go
rustup default stable

# ImbriumOS Customizations
echo "ImbriumOS - AI & Creation Optimized" | sudo tee /etc/motd

echo "=== Bootstrap Complete! ==="
echo "Next: kernel tweaks or ISO build."

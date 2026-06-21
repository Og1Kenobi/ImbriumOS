#!/bin/bash
echo "=== ImbriumOS Bootstrap v2 ==="

apt update
apt install -y ubuntu-desktop-minimal nvidia-driver-550 cuda-toolkit docker.io ollama neovim htop

# AI
pip3 install --break-system-packages torch ollama

echo "ImbriumOS Ready for AI and Creation."

#!/bin/bash

echo "Setting up the Script Variables..."
set -o nounset
disable_apparmor=true
disable_firewall=true

# Disable AppArmor
if [ "$disable_apparmor" = "true" ]; then
    echo "Disabling AppArmor..."
    sudo systemctl stop apparmor
    sudo systemctl disable apparmor
fi

# Disable Firewall
if [ "$disable_firewall" = "true" ]; then
    echo "Disabling the Firewall..."
    sudo systemctl stop ufw
    sudo systemctl disable ufw
fi

sudo apt install build-essential linux-headers-$(uname -r) -y
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt install nvidia-driver-580-server -y
sudo apt-get update
sudo apt-get install -y nvidia-fabricmanager-580=580.126.09-0ubuntu0.22.04.1
sudo systemctl enable nvidia-fabricmanager
sudo systemctl start nvidia-fabricmanager
sudo nvidia-smi -pm 1
sudo modprobe nvidia-uvm
sudo modprobe nvidia-modeset
sudo apt-get install -y cuda-toolkit-13-0 -y
sudo nvidia-smi
sudo apt install nvidia-cuda-toolkit -y
export CUDA_HOME=/usr/local/cuda-13.0
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
nvcc --version

sudo apt install docker.io -y
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

sudo apt-get install -y datacenter-gpu-manager
sudo systemctl start nvidia-dcgm
sudo systemctl status nvidia-dcgm

docker run -d --gpus all \
  --name dcgm-exporter \
  --hostname $HOSTNAME \
  -e DCGM_EXPORTER_REMOTE_HOSTNAME=$HOSTNAME \
  -p 9400:9400 \
  nvcr.io/nvidia/k8s/dcgm-exporter:latest

sudo apt install lldpd -y
sudo systemctl start lldpd
sudo systemctl enable lldpd
sudo systemctl status lldpd


sudo systemctl status nvidia-fabricmanager

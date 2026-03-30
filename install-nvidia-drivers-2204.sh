#!/bin/bash
#Nvidia-drivers
#eargueda@cisco.com

# Setup the Script Variables
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

# Install the NVIDIA CUDA Toolkit
echo "Installing the NVIDIA CUDA Toolkit..."
sudo apt install -y linux-headers-$(uname -r) build-essential
sudo apt update -y
sudo apt install -y linux-headers-$(uname -r) build-essential dkms
sudo apt update -y
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update

echo "Installing the NVIDIA toolkit..."
sudo apt-get install -y cuda-toolkit-12-9 -y

echo "Installing the NVIDIA Driver..."
sudo apt-get install -y cuda-drivers-575


# Display the monitor and manage NVIDIA Graphics Processing Unit (GPU) devices on a system.
nvidia-smi

echo "Installing the NVIDIA fabricmanager..."
sudo apt install -y nvidia-fabricmanager-575
sudo systemctl enable nvidia-fabricmanager.service
sudo systemctl start nvidia-fabricmanager.service
#pip install --upgrade vllm
sudo apt install python3-pip -y
sudo pip install --upgrade pip 


#sudo apt install nvidia-cuda-toolkit -y
export CUDA_HOME=/usr/local/cuda-12.9
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH
nvcc --version

sudo apt-get install -y cuda-demo-suite-12-9
/usr/local/cuda-12.9/extras/demo_suite/bandwidthTest

# pip install accelerate
# pip install tensorflow
# pip install torch
nvidia-smi topo -m
echo "Drivers and libs are installed"
systemctl status nvidia-fabricmanager.service

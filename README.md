# Ubuntu-NVIDIA-drivers
CUDA drivers installation, this repository will help to install CUDA Drivers, CUDA Toolkit and NVIDIA fabric manager, this applies to Nvidia H100, H200 GPUS

1.Clone the repository in your Ubuntu server
```
git clone https://github.com/cpoc-internal/Ubuntu-Nvidia-drivers.git
```
2. Change directory to the new folder
```
cd Ubuntu-Nvidia-drivers
```
3. ROOT modeInstall Nvidia-drivers ubuntu 2204, the installation will last about 10 minutes
```
git clone https://github.com/cpoc-internal/Ubuntu-Nvidia-drivers.git
chmod +x /root/Ubuntu-nvidia-drivers/install-nvidia-drivers-2204.sh
sudo -u root /root/Ubuntu-nvidia-drivers/install-nvidia-drivers-2204.sh

```
3.1 Non ROOT
```
git clone https://github.com/cpoc-internal/Ubuntu-Nvidia-drivers.git
cd Ubuntu-Nvidia-drivers
chmod +x install-nvidia-drivers-2204.sh
 ./install-nvidia-drivers-2204.sh
```
4. Install Nvidia-drivers ubuntu 2404, the installation will last about 10 minutes
```
git clone https://github.com/cpoc-internal/Ubuntu-Nvidia-drivers.git
cd Ubuntu-Nvidia-drivers
 chmod +x install-nvidia-drivers-2404.sh
 ./install-nvidia-drivers-2404.sh
```

5. provision Nic ip address UCS C885 H100, H200, AMD MI350 NON persistent
```
 chmod +x provision-nics-H100.sh
 ./provision-nics-H100.sh
```
```
 chmod +x provision-nics-H200-1.sh
 ./provision-nics-H200-1.sh
```
```
 chmod +x provision-nics-H200-2.sh
 ./provision-nics-H200-2.sh
```

6. Create new netplan config for UCS C885 H100 server persistent config 
```
 chmod +x netplan-config-H100.sh
 ./netplan-config-H100.sh
```
7. Create new netplan config for UCS C885 H200 or AMD server persistent config 

Server 1
```
 chmod +x netplan-config-1.sh
 ./netplan-config-1.sh
```

Server 2
```
 chmod +x netplan-config-2.sh
 ./netplan-config-2.sh
```

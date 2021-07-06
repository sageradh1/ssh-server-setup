# # Set a static IP via netplan
# # In most cases, the Jupyterlab Web-UI is accessed remotely via its IP address from other nodes. In these cases, a static IP is necessary and the preferred way to do so is, since Ubuntu 18.04, the configuration via netplan. Therefore, install the dependency and configure etc/netplan/01-network-manager-all.yaml similar to this example, where the network device is called eno1, the IP address 192.168.48.48 is used and the additional DNS servers are 192.168.48.2 and 192.168.48.3.
# sudo apt install net-tools
# sudo nano etc/netplan/01-network-manager-all.yaml  # configure the static ip similar as shown below:
# # Let NetworkManager manage all devices on this system
# network:
#   version: 2
#   renderer: NetworkManager
#   ethernets:
#     eno1:
#       dhcp4: no
#       addresses: [192.168.48.48/24]
#       gateway4: 192.168.48.1
#       nameservers:
#         addresses: [192.168.48.2,192.168.48.3,8.8.8.8,4.4.4.4]

# # now apply the settings
# sudo netplan generate
# sudo netplan apply --debug



# # Activate SSH
# # In order to access and maintain the server remotely, SSH has to be installed and enabled:
# sudo ufw allow 22
# sudo apt update
# sudo apt install openssh-server
# sudo systemctl status ssh
# sudo systemctl enable ssh


##Make sure virtualization is enabled
sudo apt-get update
sudo apt-get install cpu-checker
#should get response like "KVM acceleration can be used"
kvm-ok


## Some common dependencies
sudo apt-get install software-properties-common
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install python-pip python3-dev libffi-dev gcc libc-dev cargo make

#Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# # NVIDIA drivers
# # If you want to remove existing dependency
sudo apt-get purge nvidia* && sudo apt-get autoremove

# # Install ubuntu-drivers
# sudo apt update && sudo apt dist-upgrade -y && sudo apt install -f
# ubuntu-drivers devices
# sudo ubuntu-drivers autoinstall
# sudo reboot



# NVIDIA Toolkit
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker


#     # OR for my personal laptop issue of nvidia driver
# sudo apt install nvidia-cuda-toolkit

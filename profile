# Comments must be on their own lines; inline comments are not supported.
#
# The boot2docker binary reads configuration from $BOOT2DOCKER_PROFILE if set,
# or $BOOT2DOCKER_DIR/profile or $HOME/.boot2docker/profile or (on Windows)
# %USERPROFILE%/.boot2docker/profile. boot2docker config will tell you where
# it is looking for the file, and will also output the settings that are in
# use, so you can initialise a default file to customize using boot2docker
# config > /home/sven/.boot2docker/profile.

# path to VirtualBox management utility
VBM = "VBoxManage"

# path to SSH client utility
SSH = "ssh"
SSHGen = "ssh-keygen"
#SSHKey = "/Users/sven/.ssh/id_boot2docker"

# name of boot2docker virtual machine
VM = "Kalabox2"

# URL pointing either to a Github "/releases" API endpoint to automatically
# retrieve the `boot2docker.iso` asset from the latest released version of a
# repo, or directly to an ISO image
ISOURL = "https://api.github.com/repos/kalabox/kalabox-boot2docker/releases"
#ISOURL = "https://github.com/boot2docker/boot2docker/releases/download/v1.0.0/boot2docker.iso"
#ISOURL = "https://internal.corp.org/b2d.iso"

# path to boot2docker ISO image
# ISO = "/Users/sven/.boot2docker/boot2docker.iso"

# VM disk image size in MB
DiskSize = 20000

# VM memory size in MB
Memory = 2048

# host port forwarding to port 22 in the VM
SSHPort = 2022

# host port forwarding to port 2376 in the VM
DockerPort = 2376

# host-only network host IP
HostIP = "1.3.3.1"

# host only network network mask
NetMask = [255, 255, 255, 0]

# host-only network DHCP server IP
DHCPIP = "1.3.3.2"

# host-only network IP range lower bound
LowerIP = "1.3.3.7"

# host-only network IP range upper bound
UpperIP = "1.3.3.8"

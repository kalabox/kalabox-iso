# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/iso .
# docker run --rm kalabox/iso > boot2docker.iso
#

FROM boot2docker/boot2docker

# Configure networking
RUN \
    echo "ifconfig eth1 10.13.37.42 netmask 255.255.255.0 broadcast 10.13.37.255 up" >> $ROOTFS/opt/bootsync.sh

# Configure docker daemon
RUN \
  sed -i 's/: ${DOCKER_TLS:=auto}/: ${DOCKER_TLS:=no}/g' $ROOTFS/usr/local/etc/init.d/docker

# Make all the iso
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]

# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/boot2docker .
# docker run --rm kalabox/boot2docker > boot2docker.iso
#

FROM boot2docker/boot2docker

# Disable dhcp
RUN sed -i 's/^\(\s\+append .*\)$/\1 nodhcp/' /tmp/iso/boot/isolinux/isolinux.cfg

# Configure networking
RUN echo                                        >> $ROOTFS/opt/bootscript.sh && \
    echo "# Assign static ip addr"              >> $ROOTFS/opt/bootscript.sh && \
    echo "ip link set eth0 up"                  >> $ROOTFS/opt/bootscript.sh && \
    echo "ip addr add 10.13.37.42 dev eth0"     >> $ROOTFS/opt/bootscript.sh && \
    echo "ip route add 10.13.37.0/24 dev eth0"  >> $ROOTFS/opt/bootscript.sh && \
    echo "ip route add default via 10.13.13.7"  >> $ROOTFS/opt/bootscript.sh

# Configure docker networking
RUN \
  sed -i 's/: ${DOCKER_TLS:=auto}/: ${DOCKER_TLS:=no}/g' $ROOTFS/usr/local/etc/init.d/docker && \
  sed -i 's@docker daemon@& --bip=172.17.42.1/16 --dns=172.17.42.1 --dns=208.67.222.222 --dns=208.67.220.220@g' $ROOTFS/usr/local/etc/init.d/docker

# Make all the iso
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]

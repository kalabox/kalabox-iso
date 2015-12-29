# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/iso .
# docker run --rm kalabox/iso > boot2docker.iso
#

FROM boot2docker/boot2docker

# Configure a static IP until the following is resolved
#
# https://github.com/docker/machine/issues/1709
#
RUN \
    echo "# Assign static ip addr" >> $ROOTFS/opt/bootsync.sh && \
    echo "ifconfig eth1 10.13.37.100 netmask 255.255.255.0 broadcast 10.13.37.255 up" >> $ROOTFS/opt/bootsync.sh

# Need to manually add in support for vbox file share automounting on linux
# until the following is merged
#
# https://github.com/boot2docker/boot2docker/pull/1086
#
RUN rm -f $ROOTFS/etc/rc.d/vbox
ADD vbox $ROOTFS/etc/rc.d/vbox
RUN chmod +x $ROOTFS/etc/rc.d/vbox


# Make all the iso
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]

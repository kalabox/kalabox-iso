# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/iso .
# docker run --rm kalabox/iso > boot2docker.iso
#

FROM boot2docker/boot2docker

#
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

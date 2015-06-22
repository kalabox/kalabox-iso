# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/boot2docker .
# docker run --rm kalabox/boot2docker > boot2docker.iso
#

FROM boot2docker/boot2docker

COPY ./modify $ROOTFS/var/lib/boot2docker/profile

# Make all the iso
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]

# Build a custom boot2docker image for kalabox2
#
# docker build -t kalabox/boot2docker .
# docker run --rm kalabox/boot2docker > boot2docker.iso
#

FROM boot2docker/boot2docker

ENV DOCKER_TLS ""
ENV EXTRA_ARGS "$EXTRA_ARGS --bip=172.17.42.1/16 --dns=172.17.42.1 --dns=8.8.8.8"

# Make all the iso
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]

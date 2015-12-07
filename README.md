# Kalabox Iso

This contains the build scripts for the Kalabox ISO image. It is a custom Boot2Docker image.

## Getting started

You need to make sure you have installed Docker Machine. Replace with relevant version number.

### Linux:

```
curl -L https://github.com/docker/machine/releases/download/v0.5.2/docker-machine_linux-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

### OSX:

```
$ curl -L https://github.com/docker/machine/releases/download/v0.5.2/docker-machine_darwin-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

### Windows (using Git Bash):

```
$ curl -L https://github.com/docker/machine/releases/download/v0.5.2/docker-machine_windows-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

## Installing the Kalabox iso

```bash
docker-machine create \
  --driver virtualbox \
  --virtualbox-boot2docker-url https://api.github.com/repos/kalabox/kalabox-iso/releases \
  --virtualbox-hostonly-cidr 10.13.37.1/24 \
  --engine-opt bip=172.17.42.1/16 \
  --engine-opt dns=172.17.42.1 \
  --engine-opt dns=208.67.222.222 \
  --engine-opt dns=208.67.220.220 \
  Kalabox2
```

## Building the custom image

You will need to be in a docker-ready environment to do this.

```
git clone git@github.com:kalabox/kalabox-iso.git
cd kalabox-iso
docker build -t kalabox/iso .
docker run --rm kalabox/iso > boot2docker.iso
```

You can also pull the iso from the hub directly

```
docker pull kalabox/iso
```


# Kalabox Iso

This contains the build scripts for the Kalabox ISO image. It is a custom Boot2Docker image.

## Getting started

You need to make sure you have installed Docker Machine. Replace with relevant version number.

### Linux:

```
curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_linux-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

### OSX:

```
$ curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_darwin-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

### Windows (using Git Bash):

```
$ curl -L https://github.com/docker/machine/releases/download/v0.5.0/docker-machine_windows-amd64.zip >machine.zip && \
unzip machine.zip && \
rm machine.zip && \
mv docker-machine* /usr/local/bin
```

## Installing the Kalabox iso


```bash
docker-machine create \
  --driver virtualbox \
  --virtualbox-boot2docker-url https://github.com/kalabox/iso/releases/download/v1.9.1/kalabox.iso \
  --virtualbox-hostonly-cidr 10.13.37.1/24 \
  Kalabox3
```

## Building the custom image

You will need to be in a docker-ready environment to do this.

```
git clone git@github.com:kalabox/kalabox-iso.git
cd kalabox-iso
docker build -t kalabox/iso .
docker run --rm kalabox/iso > kalabox.iso
```

You can also pull the iso from the hub directly

```
docker pull kalabox/iso
```


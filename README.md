# Kalabox Boot2Docker

This contains the scaffolding to build a custom Boot2Docker image for use
with Kalabox2.

## Getting started

### Cleaning up

If you already have a B2D VM running you will want to get rid of the previous
things.

```bash
boot2docker destroy
rm -rf ~/.boot2docker
rm ~/.ssh/*boot2docker*
mkdir ~/.boot2docker
cd ~/.boot2docker
```

### Installing boot2docker

If you don't have B2D installed at all you should check out their win and
osx installers. If you are on Linux then this will all seem silly to you.

### Initializing and starting the kalabox b2d iso

And then intall the new things

```bash
mkdir ~/.boot2docker
cd ~/.boot2docker
wget https://raw.githubusercontent.com/kalabox/kalabox-boot2docker/master/profile -O profile
boot2docker init
boot2docker up
```

## Building the custom image

You will need to be in a docker-ready environment to do this.

```
git clone git@github.com:kalabox/kalabox-boot2docker.git
cd kalabox-boot2docker
docker build -t kalabox/boot2docker .
docker run --rm kalabox/boot2docker > kalabox-boot2docker.iso
```


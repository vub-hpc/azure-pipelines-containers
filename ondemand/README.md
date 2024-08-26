# Container for OpenOnDemand

This is to build the upstream container for OpenOnDemand as found in their upstream repo: https://github.com/OSC/ondemand

The dockerfile is at https://github.com/OSC/ondemand/blob/master/Dockerfile

The github action will always build the latest version and tag it with 'latest', the version itself ('v3.1.7') and the date.

Pull from ghcr.io by:
```
podman pull ghcr.io/vub-hpc/ondemand:latest
```

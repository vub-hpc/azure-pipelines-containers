# This just takes the upstream rocky 8 container and add sudo (+ epel) so we
# in azure pipelines
FROM quay.io/rockylinux/rockylinux:8
RUN dnf -y install sudo https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
CMD ["/bin/bash"]

# This just takes the upstream rocky 10 container and add sudo (+ epel) so we
# in azure pipelines
FROM quay.io/rockylinux/rockylinux:10
RUN dnf -y install sudo https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
RUN dnf config-manager --set-enabled crb
CMD ["/bin/bash"]

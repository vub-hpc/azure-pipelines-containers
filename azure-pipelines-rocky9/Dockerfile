# This just takes the upstream rocky 9 container and add sudo (+ epel) so we
# in azure pipelines
FROM quay.io/rockylinux/rockylinux:9
RUN dnf -y install sudo https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
RUN dnf config-manager --set-enabled powertools
CMD ["/bin/bash"]

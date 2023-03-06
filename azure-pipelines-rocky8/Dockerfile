# This just takes the upstream rocky 8 container and add sudo (+ epel) so we
# in azure pipelines
FROM quay.io/rockylinux/rockylinux:8
RUN dnf config-manager --set-enabled powertools
RUN dnf -y install sudo epel-release
RUN dnf -y update
CMD ["/bin/bash"]

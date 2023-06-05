# This just takes the upstream CentOS 7 container and add sudo (+ epel) so we
# in azure pipelines
FROM docker.io/library/centos:7
RUN yum -y update
RUN yum -y install sudo https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
CMD ["/bin/bash"]

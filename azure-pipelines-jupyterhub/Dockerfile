# Copyright 2024 Vrije Universiteit Brussel
#
# This file is part of notebook-platform,
# originally created by the HPC team of Vrij Universiteit Brussel (http://hpc.vub.be),
# with support of Vrije Universiteit Brussel (http://www.vub.be),
# the Flemish Supercomputer Centre (VSC) (https://www.vscentrum.be),
# the Flemish Research Foundation (FWO) (http://www.fwo.be/en)
# and the Department of Economy, Science and Innovation (EWI) (http://www.ewi-vlaanderen.be/en).
#
# https://github.com/vub-hpc/notebook-platform
#
# notebook-platform is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License v3 as published by
# the Free Software Foundation.
#
# notebook-platform is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
###
#
# JupyterHub 4.1 + Oauthenticator + batchspawner
# based on https://github.com/jupyterhub/oauthenticator/blob/main/examples/full/Dockerfile
# JupyterHub run as non-root user

FROM jupyterhub/jupyterhub:4.1

MAINTAINER VUB-HPC <hpc@vub.be>

# --- System tools ---
RUN apt update
# install SSH client for BatchSpawner
RUN apt install -y --no-install-recommends openssh-client
# make /bin/sh symlink to bash instead of dash
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

# --- Jupyter Hub extras ---
# the following steps need to open many files
# set DefaultLimitNOFILE=65536 in systemd

RUN python3 -m pip install --upgrade pip
# install Oauthenticator 
RUN python3 -m pip install oauthenticator
# install BatchSpawner: commit 3a65827c is v3.0 + our PR#254
RUN python3 -m pip install https://github.com/jupyterhub/batchspawner/archive/3a65827c0633556e5323c7607b3f9d20d1ddbbff.zip
# install Modular Slurm Spawner (vub-hpc fork)
RUN python3 -m pip install https://github.com/vub-hpc/jupyterhub_moss/archive/refs/tags/v7.6.0.tar.gz
# install vsc-config
ADD vsc-config /opt/vsc-config
RUN python3 -m pip install vsc-base
RUN python3 -m pip install /opt/vsc-config
# install static resources for theming
COPY assets/vub-hpc-logo-horiz-color.png /usr/local/share/jupyterhub/static/images/
COPY assets/vub-hpc-logo-square-color.png /usr/local/share/jupyterhub/static/images/
COPY assets/vsc-logo.png /usr/local/share/jupyterhub/static/images/

# --- JupyterHub operator: non-root user ---
# create user with same UID as outside of container
ARG operator_name
ARG operator_uid
RUN useradd --shell /bin/bash --create-home --uid $operator_uid $operator_name
# switch to operator
USER $operator_name
WORKDIR /home/$operator_name

# --- Configuration ---
# oauthenticator
RUN mkdir oauthenticator
RUN chmod 700 oauthenticator
ENV OAUTHENTICATOR_DIR "/home/jupyterhub/oauthenticator"
# use Oauth of VSC account page
ENV OAUTH2_AUTHORIZE_URL "https://account.vscentrum.be/django/oauth/authorize/"
ENV OAUTH2_TOKEN_URL "https://account.vscentrum.be/django/oauth/token/"
ENV OAUTH2_USERDATA_URL "https://account.vscentrum.be/django/oauth/current_vsc_user/"
ENV OAUTH2_USERNAME_KEY "id"

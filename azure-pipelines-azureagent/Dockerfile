FROM ubuntu:24.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common \
    libicu74

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ARG az_ag_release
ENV TARGETARCH=linux-x64
ENV TARBALL=pipelines-agent-$TARGETARCH-$az_ag_release.tar.gz

WORKDIR /azp

ADD https://vstsagentpackage.azureedge.net/agent/$az_ag_release/$TARBALL ./
RUN tar -xzf $TARBALL && rm $TARBALL


COPY files/start.sh .
RUN chmod +x start.sh run.sh

ENTRYPOINT [ "./start.sh" ]

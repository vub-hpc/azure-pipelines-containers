FROM ubuntu:22.04
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
    libicu70

#RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Can be 'linux-x64', 'linux-arm64', 'linux-arm', 'rhel.6-x64'.
ENV TARGETARCH=linux-x64
ENV RELEASE=3.226.3
ENV TARBALL=pipelines-agent-$TARGETARCH-$RELEASE.tar.gz

WORKDIR /azp

ADD https://vstsagentpackage.azureedge.net/agent/$RELEASE/$TARBALL ./
RUN tar -xzf $TARBALL && rm $TARBALL


COPY files/start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]
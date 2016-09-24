FROM ubuntu
MAINTAINER Trevor Joynson <docker@trevor.joynson.io>

ADD common/bin /usr/local/bin/
RUN image-prep

RUN set -exv \
 && lazy-apt --no-install-recommends \
        curl \
 && :

##ARG SALT_MAJOR="2016.3"
#ARG SALT_MAJOR="latest"
#ARG SALT_ARCH="amd64"
#ARG SALT_UBU_RELEASE="latest"
#ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/${SALT_UBU_RELEASE}/${SALT_ARCH}/${SALT_MAJOR}"

# Latest.
ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/latest"

# Install salt-minion
RUN set -exv \
 && lazy-apt --no-install-recommends \
    lsb-release \
 && curl -sSL "${SALT_APT_REPO}/SALTSTACK-GPG-KEY.pub" \
    | apt-key add - \
 && echo "deb $SALT_APT_REPO $(lsb_release -cs) main" >> /etc/apt/sources.list.d/saltstack-official.list \
 && lazy-apt --no-install-recommends \
        python-apt \
        salt-minion \
 && :

# Add in files
ADD sbin /sbin/

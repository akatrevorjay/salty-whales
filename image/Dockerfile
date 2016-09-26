FROM ubuntu:yakkety
MAINTAINER Trevor Joynson <docker@trevor.joynson.io>

ADD common/bin /usr/local/bin/

RUN set -exv \
 && lazy-apt --no-install-recommends \
        curl \
 && :

# Latest Ubu release, latest Salt
#ARG SALT_APT_RELEASE="latest"

# Latest Salt for Ubu release
ARG SALT_APT_RELEASE="16.10/amd64/latest"

# Specific Salt release
#ARG SALT_APT_RELEASE="16.04/amd64/2016.3"

# Build repo URL
ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/${SALT_APT_RELEASE}"

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

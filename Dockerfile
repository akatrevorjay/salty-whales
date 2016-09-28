FROM ubuntu
MAINTAINER Trevor Joynson "<docker@trevor.joynson.io>"

RUN set -exv \
 && lazy-apt --no-install-recommends \
        curl \
 && :

# Latest Ubu release, latest Salt
ARG SALT_APT_RELEASE="latest"

# Latest Salt for Ubu release
#ARG SALT_APT_RELEASE="16.04/amd64/latest"

# Specific Salt release
#ARG SALT_APT_RELEASE="16.04/amd64/2016.3"

# Build repo URL
ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/${SALT_APT_RELEASE}"

# Install salt-minion
RUN set -exv \
 && echo "Installing Salt packages" \
 && lazy-apt --no-install-recommends \
    lsb-release \
 && curl -sSL "${SALT_APT_REPO}/SALTSTACK-GPG-KEY.pub" \
    | apt-key add - \
 && echo "deb $SALT_APT_REPO $(lsb_release -cs) main" >> /etc/apt/sources.list.d/saltstack-official.list \
 && lazy-apt --no-install-recommends \
        python-apt \
        salt-minion \
        \
        ## Needed at runtime by pyopenssl for exxo build of salt-apply-state-layer
        #libssl1.0.0 \
 && :

# salt-layers
ENV STATE_ROOT=$IMAGE_ROOT/states \
    PILLAR_ROOT=$IMAGE_ROOT/pillar \
    LAYERS_ROOT=$IMAGE_ROOT/layers
RUN pip install salt-layers

# Add in files
ADD image $IMAGE_ROOT/


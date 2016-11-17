FROM trevorj/boilerplate
MAINTAINER Trevor Joynson "<docker@trevor.joynson.io>"

# Latest
ARG SALT_RELEASE="latest"
ARG SALT_PACKAGES="salt-minion"

## Pinned
#ARG SALT_RELEASE="2016.3"

# Lazy automagic (eval'd later, don't judge me)
ARG SALT_APT_RELEASE="\${DISTRIB_RELEASE}/\${DISTRIB_ARCH}/\${SALT_RELEASE}"

# Build repo URL
ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/\${SALT_APT_RELEASE}"

# Install salt-minion
ADD build.d $IMAGE_ROOT/build.d
RUN run-parts --verbose --exit-on-error -- "$IMAGE_ROOT/build.d" \
 && rm -rf "$IMAGE_ROOT/build.d"

# Add in files
ADD image $IMAGE_ROOT/


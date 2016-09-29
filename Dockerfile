FROM trevorj/boilerplate
MAINTAINER Trevor Joynson "<docker@trevor.joynson.io>"

# Latest Ubu release, latest Salt
ARG SALT_APT_RELEASE="latest"

# Latest Salt for Ubu release
#ARG SALT_APT_RELEASE="16.04/amd64/latest"

# Specific Salt release
#ARG SALT_APT_RELEASE="16.04/amd64/2016.3"

# Build repo URL
ARG SALT_APT_REPO="http://repo.saltstack.com/apt/ubuntu/${SALT_APT_RELEASE}"

# Install salt-minion
ADD build.d $IMAGE_ROOT/build.d
RUN run-parts --verbose --exit-on-error -- "$IMAGE_ROOT/build.d" \
 && rm -rf "$IMAGE_ROOT/build.d"

# Add in files
ADD image $IMAGE_ROOT/


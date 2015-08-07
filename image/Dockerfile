FROM trevorj/ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

# Add in files
ADD ./files /opt/salty-docker

# Install salt-minion
RUN apt-get update -qq \
    && apt-get install -qqy software-properties-common \
    && add-apt-repository ppa:saltstack/salt \
    && apt-get update -qq \
    && apt-get install -qqy python-apt salt-minion \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && :

# Add in entrypoint
ENV MINION_ID salty-docker

ENTRYPOINT ["/opt/salty-docker/entrypoint"]

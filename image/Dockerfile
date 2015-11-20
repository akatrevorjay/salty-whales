FROM trevorj/ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

RUN echo "Installing wget" \
    && apt-get update -q \
    && apt-get install -qy wget \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && :

RUN echo "Backwards compat" \
    && mkdir -p /opt/salty-docker \
    && ln -s /sbin/{set-minion-id,exec-as-id} /opt/salty-docker/ \
    && :

# Install salt-minion
RUN echo "Installing salt-minion" \
    && repo="http://repo.saltstack.com/apt/ubuntu/ubuntu14/latest" \
    && wget -qO - "$repo/SALTSTACK-GPG-KEY.pub" | apt-key add - \
    && echo "deb $repo $(lsb_release -cs) main" >> /etc/apt/sources.list.d/saltstack-official.list \
    && apt-get update -q \
    && apt-get install -qy python-apt salt-minion \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && : \

# Add in files
ADD sbin /sbin/

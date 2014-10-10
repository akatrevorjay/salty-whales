FROM trevorj/ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

# Update repos, upgrade possible
RUN apt-get update -qq
#RUN apt-get upgrade -qqy

# Nab apt-add-repository
RUN apt-get install -qqy software-properties-common

# Add saltstack ppa
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update -qq

# Finally, install salt-minion and python-apt (salt relies on this but it's not specified in deb atm)
RUN apt-get install -qqy python-apt salt-minion

# Add in files
ADD ./files /opt/salty-docker

# Add in entrypoint
ENV MINION_ID salty-docker
ENTRYPOINT ["/opt/salty-docker/entrypoint"]

# Cleanup
RUN rm -rf /var/lib/apt/lists/*

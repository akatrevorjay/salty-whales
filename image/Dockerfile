FROM ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Add multiverse repos
#ADD ./multiverse.list /etc/apt/sources.list.d/multiverse.list
#RUN sed -i "s/\$codename/$(lsb_release -cs)/g" /etc/apt/sources.list.d/multiverse.list

# Update repos, upgrade possible
RUN apt-get update -qq
#RUN apt-get upgrade -qqy

# Fix locale
ENV LANGUAGE en_US.UTF-8
ENV LANG $LANGUAGE
RUN locale-gen $LANG
# Reconfigure
RUN dpkg-reconfigure --frontend noninteractive locales
#RUN apt-get -qqy install language-pack-en

## Timezone
#ENV TZ "US/Eastern"
#RUN echo "$TZ" > /etc/timezone
#RUN dpkg-reconfigure --frontend noninteractive tzdata

# Base packages
#RUN apt-get install -qqy ca-certificates curl wget unzip vim

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

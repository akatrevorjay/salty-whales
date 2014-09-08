FROM ubuntu:trusty
MAINTAINER Trevor Joynson "docker@skywww.net"

# Add multiverse repos
#ADD ./multiverse.list /etc/apt/sources.list.d/multiverse.list
#RUN sed -i "s/\$codename/$(lsb_release -cs)/g" /etc/apt/sources.list.d/multiverse.list

# Nab apt-add-repository
RUN apt-get update
RUN apt-get install -y software-properties-common

# Add saltstack ppa
RUN add-apt-repository ppa:saltstack/salt
RUN apt-get update

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Finally, install salt-minion
RUN apt-get install -y salt-minion

# Add in entrypoint
#ADD ./files/salt-exec-as-id /usr/local/bin/
ENV MINION_ID salty-docker
ADD ./files/salt-exec-entrypoint /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/salt-exec-entrypoint"]

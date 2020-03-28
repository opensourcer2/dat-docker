FROM debian:10

ENV DEBIAN_FRONTEND noninteractive
ENV DIST=debian
ENV RELEASE=buster

RUN apt-get -q update
RUN apt-get install -y \
  wget \
  npm
                       
RUN npm install npm@6.13.1 -g
RUN npm install dat@13.13.1 -g

COPY startup.sh /opt/startup.sh

# Bind mount location
VOLUME [ "/opt/dat" ]

# Execute Startup script when container starts
ENTRYPOINT [ "/opt/startup.sh" ]

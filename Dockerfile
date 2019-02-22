FROM debian:stretch

RUN apt update
RUN apt install dpkg dpkg-dev apt-utils curl -y
ADD apt.conf /tmp/apt.conf
ADD sources.list /tmp/sources.list
ADD 2ping_3.2.1-1+deb9u1_all.deb /tmp/repo/
ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
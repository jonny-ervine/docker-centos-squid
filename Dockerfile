# Base on latest CentOS image
FROM centos:latest

MAINTAINER “Jonathan Ervine” <jon.ervine@gmail.com>
ENV container docker

# Install updates
RUN yum update -y; yum clean all
RUN yum install -y http://mirror.pnl.gov/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum install -y supervisor squid squidGuard calamaris
RUN yum clean all

ADD supervisord.conf /etc/supervisord.conf
ADD squid.ini /etc/supervisord.d/squid.ini
ADD start.sh /usr/sbin/start.sh
RUN chmod 755 /usr/sbin/start.sh

VOLUME /config
VOLUME /cache

EXPOSE 3128
ENTRYPOINT ["/usr/sbin/start.sh"]

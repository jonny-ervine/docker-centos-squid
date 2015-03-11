# Base on latest CentOS image
FROM centos:latest

MAINTAINER “Jonathan Ervine” <jon.ervine@gmail.com>
ENV container docker

# Install updates
RUN yum update -y; yum clean all
RUN yum install -y openssh-server squid squidGuard calamaris

RUN rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 

VOLUME /config
VOLUME /cache

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

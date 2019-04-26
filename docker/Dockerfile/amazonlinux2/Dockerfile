FROM amazonlinux:2

RUN yum install -y shadow-utils
RUN /usr/sbin/groupadd -g 1000 ec2-user && \
    /usr/sbin/useradd -u 1000 -g ec2-user -m ec2-user  && \
    /usr/sbin/usermod -p "*" ec2-user

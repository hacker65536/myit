
```Dockerfile
FROM amazonlinux:1

ENV ANSIBLE_VERSION=2.5.0
RUN echo 'LANG="LANG=en_US.UTF-8"' >> /etc/sysconfig/i18n
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN yum install -y unzip python36-pip aws-cli git jq && \
    alternatives --set python /usr/bin/python3.6 && \
    pip install --upgrade pip && \
    pip install ansible==${ANSIBLE_VERSION} && \
    rm -rf /var/cache/yum/* && \
    yum clean all
```

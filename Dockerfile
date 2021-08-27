FROM ttbb/base:jdk11

ARG version=4.14.1

RUN wget https://downloads.apache.org/bookkeeper/bookkeeper-$version/bookkeeper-server-$version-bin.tar.gz  && \
mkdir -p /opt/sh/bookkeeper && \
tar -xf bookkeeper-server-$version-bin.tar.gz -C /opt/sh/bookkeeper --strip-components 1 && \
echo "export PATH=$PATH:/opt/sh/bookkeeper/bin" >> /etc/bashrc && \
rm -rf bookkeeper-server-$version-bin.tar.gz

ENV BOOKKEEPER_HOME /opt/sh/bookkeeper

WORKDIR /opt/sh/bookkeeper
USER root

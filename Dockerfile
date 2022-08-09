FROM ttbb/base:jdk17

ENV IOTDB_HOME /opt/sh/iotdb

ARG version=0.13.0
ARG download=0.13.0-all-bin

RUN wget https://downloads.apache.org/iotdb/$version/apache-iotdb-$download.zip && \
unzip apache-iotdb-$download.zip && \
mv apache-iotdb-$download iotdb && \
rm -rf /opt/sh/iotdb/sbin/*.bat && \
rm -rf apache-iotdb-$download.zip && \
echo "end"

WORKDIR /opt/sh/iotdb

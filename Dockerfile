FROM shoothzj/compile:jdk17-mvn AS compiler

RUN git clone --depth 1 https://github.com/apache/iotdb.git && \
    cd iotdb && \
    mvn -B clean package -DskipTests=true && \
    cd distribution/target && \
    unzip apache-iotdb-1.3.0-SNAPSHOT-all-bin.zip 

FROM shoothzj/base:jdk17

ENV IOTDB_HOME /opt/iotdb

COPY --from=compiler /iotdb/distribution/target /opt/iotdb

WORKDIR /opt/iotdb

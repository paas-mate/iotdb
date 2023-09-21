FROM shoothzj/compile:jdk17-mvn AS compiler

RUN git clone --depth 1 https://github.com/apache/iotdb.git && \
    cd iotdb && \
    mvn -B clean package -DskipTests=true

FROM shoothzj/base:jdk17

ENV IOTDB_HOME /opt/iotdb

COPY --from=compiler /iotdb/distribution/target/apache-iotdb-1.3.0-SNAPSHOT-all-bin/apache-iotdb-1.3.0-SNAPSHOT-all-bin /opt/iotdb

WORKDIR /opt/iotdb

FROM --platform=linux/amd64 eclipse-temurin:17-jdk-jammy

RUN \
  mkdir -p /var/run/spring/tmp /var/run/spring/dumps \
  && apt update \
  && apt upgrade -y

COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar demo.jar

ENTRYPOINT [ \
  "java", \
  "-Xmx1024m", \
  "-Xms1024m", \
  "-Djava.io.tmpdir=/var/run/spring/tmp", \
  "-XX:+HeapDumpOnOutOfMemoryError", \
  "-XX:HeapDumpPath=/var/run/spring/dumps", \
  "-jar", \
  "demo.jar" \
  ]

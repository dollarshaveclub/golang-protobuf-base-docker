FROM golang:1.6-alpine
ENV PROTOBUF_TAG=v3.0.0-beta-3
ADD build.sh /tmp/build.sh
RUN /tmp/build.sh

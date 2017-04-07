FROM golang:1.8-alpine
ENV PROTOBUF_TAG=v3.1.0
ADD build.sh /tmp/build.sh
RUN /tmp/build.sh

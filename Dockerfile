FROM alpine:latest

WORKDIR /app

COPY CMakeLists.txt /app/
COPY src/ /app/src

RUN apk update && \
    apk add cmake build-base

RUN mkdir build 
WORKDIR /app/build

RUN cmake .. 
RUN make  

RUN adduser --disabled-password user-dev
USER user-dev
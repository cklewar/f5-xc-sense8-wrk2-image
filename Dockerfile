FROM alpine:latest

RUN apk update
RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    gcc musl-dev libffi-dev alpine-sdk openssl-dev make git
RUN git clone https://github.com/giltene/wrk2 wrk2
RUN cd wrk2 && make && mv wrk /bin/
ENTRYPOINT ["wrk"]
FROM alpine:3.9

LABEL maintainer="erguotou525@gmail.com"

WORKDIR /drone/src

RUN apk update && apk add --no-cache ca-certificates && go build -o instant-access

COPY instant-access /usr/local/bin/instant-access

ENTRYPOINT ["instant-access"]
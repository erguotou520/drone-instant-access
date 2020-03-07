FROM golang:alpine

LABEL maintainer="erguotou525@gmail.com"

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

# RUN apk update && apk add --no-cache ca-certificates && 
RUN go build -o instant-access

COPY instant-access /usr/local/bin/instant-access

ENTRYPOINT ["instant-access"]
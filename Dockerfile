FROM golang:alpine as build-stage
WORKDIR /app
COPY . .
# RUN apk update && apk add --no-cache ca-certificates && 
RUN go build -o instant-access

FROM alpine as production-stage
LABEL maintainer="erguotou525@gmail.com"
COPY --from=build-stage /app/instant-access /usr/local/bin/instant-access
ENTRYPOINT ["instant-access"]
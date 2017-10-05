FROM golang:1.7.3 as builder
WORKDIR /go/src/github.com/unacast/noop-appengine
COPY . .
RUN ./build.sh app

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/unacast/noop-appengine/app .
CMD ["./app", "app"]

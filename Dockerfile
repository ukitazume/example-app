FROM golang:1.10-alpine as build-env

LABEL ROLE "build"
ENV GO111MODULE=off

RUN apk add --no-cache make

WORKDIR ${GOPATH}/src/github.com/ukitazume/sample-app/
COPY . .

RUN make


FROM alpine:3.10
COPY --from=build-env /go/src/github.com/ukitazume/sample-app/build/webserver /bin/webserver

ENTRYPOINT ["/bin/webserver"]

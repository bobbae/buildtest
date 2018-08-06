FROM golang AS build

WORKDIR /go/src/github.com/bobbae/buildtest/example
COPY . .
ENV CGO_ENABLED=0
ENV GOPATH=/go
ENV PATH="/go/bin:${PATH}"
RUN go get -d -v ./...
RUN go install -v ./...

FROM alpine:latest

COPY --from=build /go/bin/example /usr/local/bin

ENTRYPOINT [ "example" ]
CMD []

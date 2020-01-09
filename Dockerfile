FROM golang:alpine3.11 as build
WORKDIR /gitops

LABEL MATAINER="luanngominh <ngominhluanbox@gmail.com>"

ADD . /gitops
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o gitops main.go

FROM alpine:3.11
WORKDIR /
COPY --from=build /gitops/gitops /gitops

ENTRYPOINT ["/gitops"]



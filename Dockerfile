FROM golang:alpine AS build

WORKDIR /go/src/goapp
ADD /goapp/main.go /go/src/app/
ADD /goapp/main_test.go /go/src/app/
ADD /goapp/static/ /go/src/app/

RUN go build -o helloworld .

FROM golang:alpine

LABEL maintainer="contact@storbel.com" \
org.label-schema.vcs-url="https://gitlab.com/storbel/sample_knative"

WORKDIR /go/src/app
COPY --from=build /go/src/app/ /go/src/app/

EXPOSE 8000

ENTRYPOINT ["/go/src/app/helloworld"]

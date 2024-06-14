FROM golang:1.21 as builder

COPY ./app/healthchecktest.go ./healthchecktest.go

RUN GOARCH=amd64 go build -o app healthchecktest.go

ENTRYPOINT ["./app"]

# syntax=docker/dockerfile:1

FROM golang:1.22 as builder

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY . .
RUN go mod download
ENV
RUN go build /app/cmd/server/main.go
CMD ["/app/main"]
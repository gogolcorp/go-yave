FROM golang:alpine as builder

# ----- SETUP -----

# Set the image source for ghcr.io
LABEL org.opencontainers.image.source = "https://github.com/blyndusk/repo-template"

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/repo-template

# ----- INSTALL -----

# Copy go.mod + go.sum for install before full copy
COPY go.mod .

COPY go.sum .

# Download all dependencies
RUN go mod download -x

# ----- COPY + RUN -----

# Copy the source from the current directory to the container
COPY api/ .

# Build app into specific folder
RUN go build -o ./tmp/main ./

# ----- ALPINE -----

FROM alpine

# Copy binary
COPY --from=builder /go/src/github.com/blyndusk/repo-template/ /repo-template/

# Set current directory
WORKDIR /repo-template/

# Use executable
ENTRYPOINT [ "/repo-template/tmp/main" ]
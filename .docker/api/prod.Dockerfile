FROM golang:alpine as builder

# ----- SETUP -----

# Set the image source for ghcr.io
LABEL org.opencontainers.image.source = "https://github.com/blyndusk/repo-template"

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/repo-template/api

# ----- INSTALL -----

# Copy go.mod + go.sum for install before full copy
COPY api/go.mod .

COPY api/go.sum .

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
COPY --from=builder /go/src/github.com/blyndusk/repo-template/api/ /repo-template/api/

# Set current directory
WORKDIR /repo-template/api/

# Use executable
ENTRYPOINT [ "/repo-template/api/tmp/main" ]
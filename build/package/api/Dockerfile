# DEV BUILD -----------------------------------------------------------------------------

FROM golang:alpine as dev_build

# ----- SETUP -----

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/go-yave

# ----- INSTALL -----

# Copy go.mod + go.sum for install before full copy
COPY go.mod .

COPY go.sum .

# Download all dependencies
RUN go mod download -x

# ----- COPY + RUN -----

# Copy the source from the current directory to the container
COPY . .

# Install 'air' live-reload go module
RUN go install github.com/cosmtrek/air@latest
# Use the excutable
# CMD [ "ls", "-la" ]
ENTRYPOINT ["/go/bin/air", "-d", "-c", "build/package/api/.air.conf" ]

# PROD BUILD --------------------------------------------------------------------------------------

FROM golang:alpine as prod_build

# ----- SETUP -----

# Set the image source for ghcr.io
LABEL org.opencontainers.image.source = "https://github.com/blyndusk/go-yave"

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/go-yave

# ----- INSTALL -----

# Copy go.mod + go.sum for install before full copy
COPY go.mod .

COPY go.sum .

# Download all dependencies
RUN go mod download -x

# ----- COPY + RUN -----

# Copy the source from the current directory to the container
COPY . .

# Build app into specific folder
RUN go build -o ./tmp/main ./cmd/api/main.go

# ----- ALPINE -----

FROM alpine

# Copy binary
COPY --from=prod_builder /go/src/github.com/blyndusk/go-yave/ /go-yave/

# Set current directory
WORKDIR /go-yave/

# Use executable
ENTRYPOINT [ "/go-yave/tmp/main" ]
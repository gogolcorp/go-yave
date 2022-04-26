FROM golang:alpine as development

# ----- SETUP -----

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with Go absolute path
WORKDIR /go/src/github.com/blyndusk/go-yave

# ----- DOWNLOAD MODULES -----

# Copy go.mod + go.sum for install before full copy
COPY go.* ./

# Download all dependencies
RUN go mod download -x

# Install 'air' live-reload Go module
RUN go install github.com/cosmtrek/air@latest

# ----- COPY SOURCE & RUN -----

# Copy the source from the current directory to the container
COPY . .

# Expose development port
EXPOSE 3333

# Run Go script using 'air' binary with custom conf
ENTRYPOINT ["/go/bin/air", "-d", "-c", "build/package/api/.air.conf" ]

# ------------------------------------------------------------------------

FROM golang:alpine as production

# ----- SETUP -----

# Set the image source for ghcr.io
LABEL org.opencontainers.image.source = "https://github.com/blyndusk/go-yave"

# Enable Go modules
ENV GO111MODULE=on

# Set the current working with go absolute path
WORKDIR /go/src/github.com/blyndusk/go-yave

# ----- DOWNLOAD MODULES -----

# Copy go.mod + go.sum for install before full copy
COPY go.* ./

# Download all dependencies
RUN go mod download -x

# ----- COPY SOURCE & RUN -----

# Copy specific folders to avoid large useless images
COPY cmd/ cmd/
COPY config/.env.local .env
COPY internal/ internal/
COPY pkg/ pkg/

# Build binary into temporary folder
RUN go build -o ./tmp/main ./cmd/api/main.go

ENTRYPOINT [ "./tmp/main" ]
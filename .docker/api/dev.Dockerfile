FROM golang:alpine

# ----- SETUP -----

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

# Install 'air' live-reload go module
RUN go get -u github.com/cosmtrek/air

# Use the excutable
ENTRYPOINT ["/go/bin/air"]

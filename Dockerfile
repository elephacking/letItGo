#  base image for Go
FROM golang:latest

RUN apt-get update && apt-get install -y git

RUN mkdir /app

# Set the Current Working Directory inside the container
WORKDIR /app

ADD . /app

# Build the Go app
RUN git clone https://github.com/SecurityRiskAdvisors/letitgo

RUN cd letitgo && go build -o /app/letitgo

ENTRYPOINT ["/app/letitgo"]

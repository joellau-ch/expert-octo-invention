# Dashboard Backend

## Running Locally

1. dependencies: `go mod download && go mod verify`
1. run server: `go run main.go`

## Docker

1. build `docker build -t dashboard-be .`
1. run container `docker run -dp 127.0.0.1:8080:8080 dashboard-be`

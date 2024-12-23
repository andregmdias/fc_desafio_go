FROM golang:1.16 AS builder
WORKDIR /app

RUN echo "package main\nimport \"fmt\"\nfunc main() { fmt.Println(\"Full Cycle Rocks!!\") }" > main.go
RUN go build -ldflags="-s -w" -o full_cycle_rocks main.go

FROM scratch
COPY --from=builder /app/full_cycle_rocks /full_cycle_rocks
ENTRYPOINT ["/full_cycle_rocks"]

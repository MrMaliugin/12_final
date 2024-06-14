FROM golang:1.22.3 as builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o myapp

FROM gcr.io/distroless/base-debian10
COPY --from=builder /app/myapp /app/myapp
CMD ["/app/myapp"]
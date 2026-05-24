FROM golang:1.26-alpine AS builder 

WORKDIR /app

COPY . .

RUN go build -o myappbin .


FROM alpine:latest

WORKDIR /myapp

COPY --from=builder /app/myappbin /myapp/

EXPOSE 3000

CMD [ "./myappbin" ]
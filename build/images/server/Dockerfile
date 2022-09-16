FROM docker.m.daocloud.io/golang:1.17.3 as build

WORKDIR /app

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -mod vendor -o server ./cmd/server/main.go

FROM docker.m.daocloud.io/alpine:3.15

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

COPY --from=build /app/server  /bin/

CMD ["/bin/server"]

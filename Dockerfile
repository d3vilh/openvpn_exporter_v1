FROM arm64v8/alpine as build
RUN apk update && apk add --no-cache make git go bash
WORKDIR /opt
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN make generate
RUN make build
FROM arm64v8/alpine 
LABEL maintainer="Mr.Philipp <d3vilh@github.com>"
EXPOSE 9176
WORKDIR /usr/local/bin
COPY --from=build /opt/bin/openvpn_exporter /usr/local/bin
COPY docker-entrypoint.sh /usr/local/bin
RUN mkdir -p /etc/openvpn/log
ENTRYPOINT [ "docker-entrypoint.sh" ]

FROM arm64v8/debian
WORKDIR /opt
EXPOSE 9176
ARG DEBIAN_FRONTEND=noninteractive
ADD bin/openvpn_exporter /opt/openvpn_exporter
#ADD scripts/start.sh /opt/start.sh
RUN mkdir -p /etc/openvpn/log
RUN chmod +x /opt/openvpn_exporter
#CMD /opt/start.sh
ENTRYPOINT /opt/openvpn_exporter --status-file \
                "$OVPN_STATUS_FILE"
#CMD ["/openvpn_exporter", "--openvpn.status_path=/etc/openvpn_exporter/server.status"]

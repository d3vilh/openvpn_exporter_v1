#!/bin/sh
echo "Running openvpn_exporter."
openvpn_exporter --status-file $OVPN_STATUS_FILE

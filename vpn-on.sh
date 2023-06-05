#!/bin/sh

sudo ip route flush 172.19.0.0/16
sudo wg-quick up /etc/wireguard/wg0.conf

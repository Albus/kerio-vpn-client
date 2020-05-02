# kerio-vpn-client
Kerio VPN Client docker container

# How to use this image
This image connects to Kerio VPN Server

## Sharing connection

### With host

You can use flag `--net=host`

### With another containers

Use flag `--net=container:kerio-container` for the containers where you want to use the connection.

## Examples of configuration
```bash
docker run --name kerio -h kerio -d --restart always \
--net=host --cap-add=NET_ADMIN --device /dev/net/tun \
albus/kerio-vpn-client start "server.domain.com" "username" "password"
```

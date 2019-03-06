## frp-docker

dockerize frp  
refre to https://github.com/fatedier/frp

persist volume  
/conf 

## how to use 

default action is starting a server
### server
```
cat > frps.ini << EOF
[common]
bind_port = 7000
vhost_http_port = 7001
EOF

docker run -d -p 7000:7000 -p 7001:7001 -v $(pwd)/frps.ini:/conf/frps.ini amanohikaru/frp-docker
```
### client
```
cat > frpc.ini << EOF
[common]
server_addr = 218.168.168.59
server_port = 7000

[web]
type = http
local_port = 4000
custom_domains = amano.com
EOF

docker run --network host -d -v $(pwd)/frpc.ini:/conf/frpc.ini amanohikaru/frp-docker client
```

## Version

- 0.24.0
#!bin/sh


if [[ "$@" = "client" ]]
then
    echo client
    ./frpc -c /conf/frpc.ini
elif [[ "$@" = "server" ]]
then
    echo server
    ./frps -c /conf/frps.ini
else
    echo did you mean client ? 
    exit 1
fi


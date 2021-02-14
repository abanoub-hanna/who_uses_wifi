#!/bin/bash

# ifconfig | grep broadcast | awk '{print $2}'

pingOut(){
  connd="192.168.1.$1"
  ntry="$(ping -c 1 $connd | grep received | awk {'print $4'})"
  if [ $ntry == 1 ]; then
    echo "$connd connected"
#  else
#    echo "$connd not connected"
  fi
}

for i in {1..255}; do
  pingOut $i &
done
wait

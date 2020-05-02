#!/usr/bin/env bash
set -o nounset

case $1 in
"start")
  sh /usr/bin/configure-kerio.sh $2 $3 $4
  /etc/init.d/kerio-kvc start
  while ! ip a show kvnet up | grep inet 2>/dev/null; do
    sleep 1
  done  ;;
"stop")
  /etc/init.d/kerio-kvc stop
  trap - SIGINT SIGTERM
  exit 0
 ;;
esac

trap unmount SIGINT SIGTERM

sleep infinity &
wait

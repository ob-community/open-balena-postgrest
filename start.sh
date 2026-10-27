#!/bin/bash

pids=()
stopping=""

stop() {
  stopping=1
  kill -TERM "${pids[@]}" 2>/dev/null
}
trap stop TERM INT

NODE_ENV=development node postgrest-proxy.js &
pids+=("$!")
/bin/postgrest &
pids+=("$!")

if [ -n "$stopping" ]; then
  stop
fi

wait -n
status=$?
stop
wait
exit "$status"

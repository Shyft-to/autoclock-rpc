#!/bin/bash

SLOT_DIFFERENCE=900
SLEEP_TIME=60
RUNNING=false

PROCESS_NAME="agave-validator"
#PROCESS_NAME="solana-test-validator"
#RPC_URL="http://84.32.186.148/a1fb2ed4-f5df-4688-982b-4fad1944ef0e"
RPC_URL="http://localhost:8899"

rpc_state() {
	local slots_behind=$(curl $RPC_URL \
		--header 'Content-Type: application/json' \
		--data '{"jsonrpc":"2.0","id":1, "method":"getHealth"}' | jq '.error.data.numSlotsBehind')
	echo $slots_behind
}

rpc_health() {
  local healthy=$(curl $RPC_URL \
    --header 'Content-Type: application/json' \
    --data '{"jsonrpc":"2.0","id":1, "method":"getHealth"}' | jq '.result')

  if [ "$healthy" = '"ok"' ]; then
    echo "true"
  else
    echo "false"
  fi
}

while true
do 
  # Get the PID and elapsed time of the process
  PROCESS_INFO=$(ps -eo pid,etimes,comm | grep -w "$PROCESS_NAME" | grep -v grep)

  if [ -z "$PROCESS_INFO" ]; then
    echo "Process '$PROCESS_NAME' is not running. Retry in $SLEEP_TIME s"
    sleep $SLEEP_TIME
    continue
  fi

  #call rpc_state function and check if it returns true
  running=$(rpc_health)
  echo "RUnnig:: $running"

  if [ $RUNNING = false ] && [ "$running" = "false" ]; then
    echo "RPC health check failed, Retrying in $SLEEP_TIME s"
    sleep $SLEEP_TIME
    continue
  fi

  RUNNING=true

  slot=$(rpc_state)

  if [ "$slot" -gt $SLOT_DIFFERENCE ]; then
    echo "Behind resstart, On for: $ELAPSED_SECONDS"
    RUNNING=false
    sh /home/solana/restart.sh 1
  else
    echo "RPC status ok, behind by slot: $slot, running form: $ELAPSED_SECONDS"
  fi

  echo "sleeping ofr $SLEEP_TIME s"
  sleep $SLEEP_TIME
done

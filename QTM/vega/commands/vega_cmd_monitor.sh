#!/bin/bash
# Runs vega command monitor
# Run with: ./vega_cmd_monitor.sh
# Requires: custom libzmq built to handle CLIENT/SERVER sockets

# Path to python venv where custom pyzmq is installed
[ -z "$VENV_PATH" ] && export VENV_PATH="$HOME/python3-zmq-draft-venv"
# Path to vega command downstream
[ -z "$VEGA_DOWNSTREAM" ] && export VEGA_DOWNSTREAM="tcp://127.0.0.1:24442"
# Path to modified libzmq
[ -z "$LIBZMQ_PATH" ] && export LIBZMQ_PATH="/lib/libzmq.so"

source "$VENV_PATH/bin/activate"
LD_PRELOAD=$LIBZMQ_PATH python3 $VENV_PATH/vega_cmd_monitor.py $VEGA_DOWNSTREAM
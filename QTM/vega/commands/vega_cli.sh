#!/bin/bash
# Sends command to vega
# Run with: ./vega_cli.sh <command>
# Requires: custom libzmq built to handle CLIENT/SERVER sockets

# Path to python venv where custom pyzmq is installed
[ -z "$VENV_PATH" ] && export VENV_PATH="$HOME/python3-zmq-draft-venv"
# Path to vega command upstream
[ -z "$VEGA_UPSTREAM" ] && export VEGA_UPSTREAM="tcp://127.0.0.1:24424"
# Path to modified libzmq
[ -z "$LIBZMQ_PATH" ] && export LIBZMQ_PATH="/opt/vega-dist/libzmq/libzmq.so"

# source "$VENV_PATH/bin/activate"
LD_PRELOAD=$LIBZMQ_PATH python3 vega_cli.py $VEGA_UPSTREAM "$1"

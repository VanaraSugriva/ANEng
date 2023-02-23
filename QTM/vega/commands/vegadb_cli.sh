#!/bin/bash
# Sends command to vegadb
# Run with: ./vegadb_cli.sh <command>
# Requires: custom libzmq built to handle CLIENT/SERVER sockets

# Path to python venv where custom pyzmq is installed
[ -z "$VENV_PATH" ] && export VENV_PATH="$HOME/python3-zmq-draft-venv"
# Path to vegadb command upstream
[ -z "$VEGADB_UPSTREAM" ] && export VEGADB_UPSTREAM="tcp://127.0.0.1:30308"
# Path to modified libzmq
[ -z "$LIBZMQ_PATH" ] && export LIBZMQ_PATH="/lib/libzmq.so"

source "$VENV_PATH/bin/activate"
LD_PRELOAD=$LIBZMQ_PATH python3 $VENV_PATH/vega_cli.py $VEGADB_UPSTREAM "$1"

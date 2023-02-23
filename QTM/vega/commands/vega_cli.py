#!/usr/bin/env python3
# Sends command to VEGA-like command server (vega/vegadb) and receives reply
# Requires: custom libzmq built to handle CLIENT/SERVER sockets

import zmq
import msgpack
import time, sys, ast
import os.path as path
from sys import exit

g_scriptname = path.basename(sys.argv[0]);

def main():
    if len(sys.argv) < 3:
        print(f"Usage: { g_scriptname } publisher-point/\"-\" command");
        exit(-1);
    vega_uplink_point_ = sys.argv[1] if sys.argv[1] != "-" else "tcp://127.0.0.1:55000";
    zmq_ctx_ = zmq.Context.instance();
    client_sock_ = zmq_ctx_.socket(zmq.CLIENT);
    client_sock_.connect(vega_uplink_point_);
    print(f"[{ time.asctime() }] [{ g_scriptname }] Created CLIENT ZMQ socket on {vega_uplink_point_}");
    time.sleep(1);
    msg_ = ast.literal_eval(sys.argv[2]);
    print(f"[{ time.asctime() }] [{ g_scriptname }] Sending message to: {vega_uplink_point_} Message: {msg_}");
    client_sock_.send(msgpack.packb(msg_));
    print(f"[{ time.asctime() }] [{ g_scriptname }] Waiting for response");
    r_ = client_sock_.poll();
    if r_ != zmq.POLLIN:
        print(f"[{ time.asctime() }] [{ g_scriptname }] Poll failed with {r_}");
    response_ = client_sock_.recv(copy=True);
    print(f"[{ time.asctime() }] [{ g_scriptname }] Received response: { msgpack.unpackb(response_) }");

if __name__ == "__main__":
    main();
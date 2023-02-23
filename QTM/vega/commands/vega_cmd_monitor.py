#!/usr/bin/env python3
# VEGA command monitor. Logs all commands and replies from VEGA.
# Requires: custom libzmq built to handle CLIENT/SERVER sockets

import zmq
import msgpack
import logging
import time, sys
import os.path as path
from sys import exit
from time import asctime as ts

g_cid_ranges = [
    {
        "name": "Watchdog",
        "cid": {
            "from": 1464102759,
            "to": 1464102759
        }
    },
    {
        "name": "NLS.Blacklist.Update",
        "cid": {
            "from": 1312967765,
            "to": 1313067765
        }
    },
    {
        "name": "Login.Blacklist.Update",
        "cid": {
            "from": 1279413333,
            "to": 1279513333
        }
    },
    {
        "name": "Domain.Blacklist.Update",
        "cid": {
            "from": 1380205141,
            "to": 1380305141
        }
    },
    {
        "name": "Redirect.Status.Script",
        "cid": {
            "from": 1382372179,
            "to": 1382472179
        }
    },
    {
        "name": "0.0.Control.System",
        "cid": {
            "from": 808469331,
            "to": 808534866
        }
    },
    {
        "name": "0.1.Control.System",
        "cid": {
            "from": 808534867,
            "to": 808600402
        }
    }
];
g_vega_replay_channel = b'CMD_REPLAY;';
g_vega_result_channel = b'CMD_RESULT;';
g_scriptname = path.basename(sys.argv[0]);

def find_user_cid(cid):
    for user in g_cid_ranges:
        if user["cid"]["from"] <= cid <= user["cid"]["to"]:
            return user["name"];
    return "Unknown CID";

def main():
    if len(sys.argv) < 2:
        print(f"Usage: { g_scriptname } publisher-point/\"-\" [/path/to/log/file]");
        exit(-1);
    vega_downlink_point_ = sys.argv[1] if sys.argv[1] != "-" else "tcp://127.0.0.1:55001";
    log_file_path_ = sys.argv[2] if len(sys.argv) >= 3 else "/var/log/vega-cmd.log";
    logging.basicConfig(filename=log_file_path_,level=logging.INFO, format='%(asctime)s %(name)-8s %(levelname)-5s: %(message)s');
    zmq_ctx_ = zmq.Context.instance();
    sub_sock_ = zmq_ctx_.socket(zmq.SUB);
    sub_sock_.connect(vega_downlink_point_);
    logging.info(f"Created SUB ZMQ socket on {vega_downlink_point_}");
    time.sleep(1);
    sub_sock_.setsockopt(zmq.SUBSCRIBE, g_vega_replay_channel);
    sub_sock_.setsockopt(zmq.SUBSCRIBE, g_vega_result_channel);
    while True:
        r_ = sub_sock_.poll();
        if r_ != zmq.POLLIN:
            logging.error(f"Socket error: { r_ }");
            continue;
        msg_ = sub_sock_.recv(flags=zmq.NOBLOCK, copy=True);
        is_replay_ = msg_.startswith(g_vega_replay_channel);
        if not is_replay_:
            is_result_ = msg_.startswith(g_vega_result_channel);
        if not (is_replay_ or is_result_):
            logging.warning(f"Received message from unknown channel. Message: <<{ msg_ }>>");
            continue;
        if is_replay_:
            channel_ = "REPLAY";
            msg_ = msg_[len(g_vega_replay_channel):];
        else:
            channel_ = "RESULT";
            msg_ = msg_[len(g_vega_result_channel):];
        unpacked_msg_ = msgpack.unpackb(msg_);
        try:
            user_name_ = find_user_cid(unpacked_msg_[b"cid"]);
        except KeyError:
            user_name_ = "Missing CID";
        logging.info(f"Channel: {channel_} From: {user_name_} Message: {unpacked_msg_}");

if __name__ == "__main__":
    main();
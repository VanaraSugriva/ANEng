#!/bin/bash

ENV_PATH_="/opt/vega-dist/scripts/commands"

cd ${ENV_PATH_}
./vega_cli.sh '{"cmd":"redirect.ua_filter","cid":cid,"params":{"state":"enable"}}'
./vega_cli.sh '{"cmd":"redirect.ua_filter_whitelist.load","cid":cid,"params":{"path":"/etc/ua_lists/ua_whitelist"}}'
./vega_cli.sh '{"cmd":"redirect.ua_filter_blacklist.load","cid":cid,"params":{"path":"/etc/ua_lists/ua_blacklist"}}'

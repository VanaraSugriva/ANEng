#!/bin/bash

ENV_PATH_="/opt/vega-dist/scripts/commands"

cd ${ENV_PATH_}
# ./vega_cli.sh '{"cmd":"clickstream.ip_filter","cid":cid,"params":{"state":"enable"}}'
./vega_cli.sh '{"cmd":"clickstream.ip_filter.load","cid":cid,"params":{"path":"/opt/vega-dist/etc/clickstream-ip.filter"}}'

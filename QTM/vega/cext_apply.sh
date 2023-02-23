#!/bin/bash

ENV_PATH_="/opt/vega-dist/scripts/commands"

cd ${ENV_PATH_}
./vega_cli.sh '{"cmd":"clickstream.bl_ext_files","cid":cid,"params":{"state":"enable"}}'
./vega_cli.sh '{"cmd":"clickstream.bl_ext_files.load","cid":cid,"params":{"path":"/opt/vega-dist/etc/clickstream-ext.filter"}}'

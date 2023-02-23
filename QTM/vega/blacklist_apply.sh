#!/bin/bash

ENV_PATH_="/opt/vega-dist/scripts/commands"

cd ${ENV_PATH_}
./vega_cli.sh '{"cmd":"redirects","cid":cid,"params":{"state": "disable"}}'
./vega_cli.sh '{"cmd":"redirect.log","cid":cid,"params":{"state": "disable"}}'

./vega_cli.sh '{"cmd": "redirect.reset_clients", "cid": cid, "params": {"list": "black"}}'
./vega_cli.sh '{"cmd": "redirect.customize_clients", "cid": cid, "params": {"list":"unbound", "action":"add", "path":"/home/qt.support/login.blacklist"}}'
./vega_cli.sh '{"cmd": "redirect.customize_clients", "cid": cid, "params": {"list":"black", "action":"add", "path":"/home/qt.support/nls.blacklist"}}'

./vega_cli.sh '{"cmd":"redirects","cid":cid,"params":{"state": "enable"}}'
./vega_cli.sh '{"cmd":"redirect.log","cid":cid,"params":{"state": "enable"}}'

#!/usr/bin/env python
# _*_ coding: utf-8 _*_

import requests

HEADERS = {'Content-Type': 'application/json', 'Accept': 'application/json'}
NB_URL = "http://netbox.linkmeup.ru:45127"

request_url = f"{NB_URL}/api/dcim/devices/"
devices = requests.get(request_url, headers = HEADERS)
print(devices.json())
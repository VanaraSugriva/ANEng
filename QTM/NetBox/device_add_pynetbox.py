#!/usr/bin/env python
# _*_ coding: utf-8 _*_

import pynetbox

API_TOKEN = ""
NB_URL = "http://192.168.17.49:8000"
nb = pynetbox.api(NB_URL, token = API_TOKEN)

device_parameters = {
    "name": "just a simple PYNETBOX girl",
    "device_type": 1,
    "device_role": 1,
    "site": 3,
}
new_device = nb.dcim.devices.create(**device_parameters)
print(new_device)

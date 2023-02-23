#!/usr/bin/env python
# _*_ coding: utf-8 _*_

import pynetbox

NB_URL = "http://netbox.linkmeup.ru:45127"
nb = pynetbox.api(NB_URL)

devices = nb.dcim.devices.all()
print(devices)
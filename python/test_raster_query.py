#!/usr/bin/python
# -*- coding: utf-8 -*-

import requests, json
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

SERVER_URL = 'https://gws.gplates.org/'
proxies = {'http':''}

data={'lon':-70, 'lat':34, 'raster_name':'age_grid'}
r = requests.get(SERVER_URL+'/raster/query/', params=data, verify=False, proxies=proxies)
print(r.text)


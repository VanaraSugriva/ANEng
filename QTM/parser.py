#!/usr/bin/env python

'''
parser for publisher segments
'''

import requests
from bs4 import BeautifulSoup as BS
import lxml
from time import sleep

# urls:
url_login = 'http://p.mobilebanner/admin/login'
# url_login = 'http://moscow.hh.ru/account/login'

url_admin = 'http://p.mobilebanner/admin/'
url_segin = 'http://p.mobilebanner/admin/segments'

# data for client requests
user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0'
data = {'login': 'qt.support', 'password': 'Noviinadejniipar0l2'}
headers = {'User-Agent': user_agent}

# open up a session:
client = requests.Session()

# get request:
r = client.get(url_login, headers=headers)
sleep(2)
# update headers:
client.headers.update({'Referer': url_login})
sleep(2)
client.headers.update({'User-Agent': user_agent})
sleep(2)
# test for getting cookies:
print(client.cookies)

# get the csrf-token from meta tag
# soup = BS(get.text,'lxml')
# csrf = soup.find('meta', {'name':'_csrf-token'})['content']


def auth(url):
    login = client.post(url_login, data=data, headers=headers)

    if '_csrf_token' in client.cookies:
        csrf = client.cookies['_csrf_token']


def get_html(url, params='None'):
    r = requests.get(url, headers=HEADERS, params=params)


def get_content(html):
    pass


def parse(html):
    pass

# parse()

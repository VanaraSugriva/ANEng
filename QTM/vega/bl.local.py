#!/usr/bin/env python

import sys
import subprocess

try:
    nls = sys.argv[1]
    login = sys.argv[2]
except IndexError:
    print('IndexError: list index out of range: need 2 params: nls and login')

else:
    with open('/home/qt.support/nls.blacklist', 'w') as nls_bl, open('/home/qt.support/login.blacklist', 'w') as login_bl:
        nls_bl.write(nls + '\n')
        login_bl.write(login + '\n')

        if '@' in login:
            login = login.split('@')[0]
            login_bl.write(login + '\n')

    subprocess.call(['sh', '/home/qt.support/./blacklist_apply.sh'])

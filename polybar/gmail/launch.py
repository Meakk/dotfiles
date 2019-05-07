#!/usr/bin/env python

import os
import pathlib
import subprocess
import time
import argparse
from apiclient import discovery, errors
from oauth2client import client, file
from httplib2 import ServerNotFoundError

DIR = os.path.dirname(os.path.realpath(__file__))
CREDENTIALS_PATH = os.path.join(DIR, 'credentials.json')

def update_count():
    gmail = discovery.build('gmail', 'v1', credentials=file.Storage(CREDENTIALS_PATH).get())
    labels = gmail.users().labels().get(userId='me', id='INBOX').execute()
    count = labels['messagesUnread']
    print(count)

try:
    if pathlib.Path(CREDENTIALS_PATH).is_file():
        update_count()
    else:
        print('credentials not found')
except (errors.HttpError, ServerNotFoundError, OSError) as error:
    print('connection failed')
except client.AccessTokenRefreshError:
    print('revoked/expired credentials')

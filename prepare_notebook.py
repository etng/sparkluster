#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import json
from notebook.auth import passwd
payload = {
    "NotebookApp": {
        "password": "",
        "notebook_dir": "/vagrant/notebooks",
        "ip": '*',
        "open_browser": False,
        "port": 8888,
    }
}
with open(os.path.expanduser('~/.jupyter/jupyter_notebook_config.json'), 'w') as f:
    payload['NotebookApp']['password'] = passwd(os.environ.get('JUPYTER_NOTEBOOK_PASSWORD'))
    f.write(json.dumps(payload, indent=2))

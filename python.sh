#!/bin/bash
set -e
source /pd_build/buildconfig

header "Install Additional Python libs required for Kingswood Module"

## Install Python.
run pip install --upgrade --use-wheel --no-index --pre \
        --find-links=/pd_build/lib  --requirement=/pd_build/requirements.txt


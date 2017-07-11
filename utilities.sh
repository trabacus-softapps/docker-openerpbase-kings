#!/bin/bash
set -e
source /pd_build/buildconfig

## Install PhantomJS (www.phantomjs.org) is a headless WebKit scriptable with JavaScript.
run minimal_apt_get_install chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 tesseract-ocr
curl -Lf -o /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
run sudo tar xvjf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
run sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

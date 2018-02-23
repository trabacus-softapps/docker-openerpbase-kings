#!/bin/bash
set -e
source /pd_build/buildconfig

# Install dependencies & firefox.
run minimal_apt_get_install chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 tesseract-ocr wget openjdk-8-jre-headless xvfb libxi6 libgconf-2-4 firefox

# Install ChromeDriver.
run wget -N https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz -P /tmp
run cd /tmp
run tar -xvzf /tmp/geckodriver-v0.19.1-linux64.tar.gz
run rm /tmp/geckodriver-v0.19.1-linux64.tar.gz
run sudo mv -f /tmp/geckodriver /usr/local/bin/geckodriver
run sudo chown root:root /usr/local/bin/geckodriver
run sudo chmod 0755 /usr/local/bin/geckodriver

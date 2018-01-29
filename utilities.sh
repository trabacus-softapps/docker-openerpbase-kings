#!/bin/bash
set -e
source /pd_build/buildconfig

# Install dependencies.
run minimal_apt_get_install chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 tesseract-ocr unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4

# Install Chrome & Chromium
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
run sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
run sudo apt-get -y update
run sudo apt-get -y install google-chrome-stable chromium-browser

# Install ChromeDriver.
run wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P /tmp
run unzip /tmp/chromedriver_linux64.zip -d /tmp
run rm /tmp/chromedriver_linux64.zip
run sudo mv -f /tmp/chromedriver /usr/local/bin/chromedriver
run sudo chown root:root /usr/local/bin/chromedriver
run sudo chmod 0755 /usr/local/bin/chromedriver

# Install Chromexvfb.
run cp /pd_build/lib/xvfb-chromium /usr/bin/xvfb-chromium
run mv /usr/bin/google-chrome /usr/bin/google-chrome-ori
run mv /usr/bin/chromium-browser /usr/bin/chromium-browser-ori
run ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
run ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

## Install PhantomJS (www.phantomjs.org) is a headless WebKit scriptable with JavaScript.
#curl -Lf -o /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
#run sudo tar xvjf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
#run sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/

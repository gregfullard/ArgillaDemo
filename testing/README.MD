# BDD Testing Project

This is the BDD Testing demo. It uses Serenity, Selenium, and Cucumber for automated BDD-style testing of the solution

## Prerequisites

Before using this project, you will need to have the relevant WebDriver executable files installed on your machine.

see: https://gist.github.com/ziadoz/3e8ab7e944d02fe872c3454d17af31a5

## Install ChromeDriver
```
export CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
cd ~/Downloads
wget http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
sudo mkdir -p /opt/webdrivers
sudo mv -f chromedriver /opt/webdrivers/chromedriver
sudo ln -s /opt/webdrivers/chromedriver /usr/local/bin/chromedriver

export GECKO_DRIVER_VERSION=v0.20.1
cd ~/Downloads
wget https://github.com/mozilla/geckodriver/releases/download/$GECKO_DRIVER_VERSION/geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
tar -xvzf geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
rm geckodriver-$GECKO_DRIVER_VERSION-linux64.tar.gz
sudo mkdir -p /opt/webdrivers
sudo mv -f geckodriver /opt/webdrivers/geckodriver
sudo ln -s /opt/webdrivers/geckodriver /usr/local/bin/geckodriver
```

## How to run the tests Locally

Make sure you're not running in a terminal with a configured http_proxy:

    unset http_proxy

The tests are run using mvn. Use the following commands to run the tests and pass the path of your web driver executable:

### For Chrome

    mvn verify -Dwebdriver.chrome.driver=<path-to-chrome-driver> -Dwebdriver.driver=chrome -Dcontext=chrome
    
e.g.

    mvn verify -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -Dwebdriver.driver=chrome -Dcontext=chrome
    
or (in headless mode)

    mvn verify -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -Dwebdriver.driver=chrome -Dcontext=chrome Dchrome.switches=--headless

### For FireFox:

    mvn verify -Dwebdriver.gecko.driver=<path-to-gecko-driver> -Dwebdriver.driver=firefox -Dcontext=firefox

e.g.  
    
    mvn verify -Dwebdriver.gecko.driver=/usr/local/bin/geckodriver -Dwebdriver.driver=firefox -Dcontext=firefox

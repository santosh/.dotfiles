#!/bin/bash

# Ubuntu verison of bootstrap is there for Windows Subsystem for Linux. Thus, 
# it does not need to fully fleged

##### 0. Update #####

apt update
apt -y upgrade


##### 1. Installation #####

##### 1.1 Developer Tools #####

apt install -y build-essential

# golang lags 1 year in LTS version, is it important?
apt install golang bat

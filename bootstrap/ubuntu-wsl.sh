#!/bin/bash

# This verison of bootstrap is there for Windows Subsystem for Linux. Thus, 
# it does not need to fully fleged

##### 0. Update #####

sudo apt update
sudo apt -y upgrade


##### 1. Installation #####
sudo apt install make

##### 1.1 Developer Tools #####

apt install -y build-essential

# golang lags 1 year in LTS version, is it important?
sudo apt install golang bat

#!/bin/sh

BASE=/tmp

# Prep Work
mkdir -p $BASE
cd $BASE
rm -f $BASE/master.zip

# Install Unzip
apt-get install -y unzip

# Download Repo
curl -LO https://github.com/bvallelunga/vm-init/archive/master.zip

# Unzip Repo
unzip -q -o $BASE/master.zip -d $BASE
rm -f $BASE/master.zip

# Run Command
/bin/bash $BASE/vm-init-master/install.sh

#!/usr/bin/env bash

# Prep Work
mkdir -p /tmp
cd /tmp
rm -f /tmp/master.zip

# Wget Install Zipped Repo
curl -LO https://github.com/bvallelunga/vm-init/archive/master.zip

# Install Unzip
apt-get install -y unzip

# Unzip Repo
unzip -q -o /tmp/master.zip -d /tmp
rm -f /tmp/master.zip

# Run Command
bash /tmp/vm-init-master/install.sh

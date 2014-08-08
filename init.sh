#!/bin/sh

# Prep Work
mkdir -p /tmp
cd /tmp
rm -f /tmp/master.zip

# Install Unzip
apt-get install -y unzip

# Download Repo
curl -LO https://github.com/bvallelunga/vm-init/archive/master.zip

# Unzip Repo
unzip -q -o /tmp/master.zip -d /tmp
rm -f /tmp/master.zip

# Run Command
bash /tmp/vm-init-master/install.sh

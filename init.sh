#!/usr/bin/env bash

# Prep Work
mkdir -p /tmp
cd /tmp
rm master.zip

# Wget Install Zipped Repo
curl -LO https://github.com/bvallelunga/vm-init/archive/master.zip

# Unzip Repo
unzip -q -o /tmp/master.zip -d /tmp
rm -f /tmp/master.zip

# Call Command
bash /tmp/vm-init-master/install.sh $1

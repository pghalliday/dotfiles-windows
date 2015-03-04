#!/bin/bash

set -e

sudo rm -rf ./vendor/
mkdir ./vendor/
chef exec berks vendor ./vendor/cookbooks/
cat > ./vendor/converge.bat << 'EOH'
chef-client -z -j C:\dotfiles\attributes.json -r workstation
EOH

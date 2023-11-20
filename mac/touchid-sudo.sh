#!/usr/bin/env bash

# Allows using Touch ID for sudo

set -e

if grep -q "pam_tid.so" /etc/pam.d/sudo; then
    exit 1
fi

sudo chmod 644 /etc/pam.d/sudo;
sudo cp /etc/pam.d/sudo /etc/pam.d/sudo.bak;
echo 'auth       sufficient     pam_tid.so' | cat - /etc/pam.d/sudo > sudo && sudo mv sudo /etc/pam.d/sudo;
sudo chmod 444 /etc/pam.d/sudo;

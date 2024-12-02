#!/usr/bin/env bash

# Allows using Touch ID for sudo

set -e

MAJOR_MAC_VERSION=$(sw_vers -productVersion | cut -d '.' -f 1,2)
SONOMA_VERSION="14.1"  # Sonoma

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
function version_le() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

# if version_gt $MAJOR_MAC_VERSION $SONOMA_VERSION; then
#     echo "$MAJOR_MAC_VERSION is greater than $SONOMA_VERSION"
# fi

# if version_le $MAJOR_MAC_VERSION $SONOMA_VERSION; then
#     echo "$MAJOR_MAC_VERSION is less than or equal to $SONOMA_VERSION"
# fi

# if version_lt $MAJOR_MAC_VERSION $SONOMA_VERSION; then
#     echo "$MAJOR_MAC_VERSION is less than $SONOMA_VERSION"
# fi

function old_touchid_patch() {
    if grep -q "pam_tid.so" /etc/pam.d/sudo; then
        exit 1
    fi

    sudo chmod 644 /etc/pam.d/sudo;
    sudo cp /etc/pam.d/sudo /etc/pam.d/sudo.bak;
    echo 'auth       sufficient     pam_tid.so' | cat - /etc/pam.d/sudo > sudo && sudo mv sudo /etc/pam.d/sudo;
    sudo chmod 444 /etc/pam.d/sudo;
}

function new_touchid_patch() {
    if test -f /etc/pam.d/sudo_local; then
        echo "/etc/pam.d/sudo_local exists. Stop";
        exit 1
    fi

    sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
    sudo chmod 644 /etc/pam.d/sudo_local;
    sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
    sudo chmod 444 /etc/pam.d/sudo_local;
}

if version_ge $MAJOR_MAC_VERSION $SONOMA_VERSION; then
    echo "$MAJOR_MAC_VERSION is greater than or equal to $SONOMA_VERSION. Using new method";
    new_touchid_patch
else
    old_touchid_patch
fi

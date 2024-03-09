#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi
SSH_KEY=$(curl -s "https://raw.githubusercontent.com/ha1fdan/ssh/master/id_ed25519.pub")
if [ -n "$SSH_KEY" ]; then
    mkdir -p "/root/.ssh"
    echo "$SSH_KEY" > "/root/.ssh/authorized_keys"
    chmod 700 "/root/.ssh"
    chmod 600 "/root/.ssh/authorized_keys"
    echo "SSH key installed for user root."
else
    echo "Failed to download SSH key."
fi

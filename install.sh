#!/bin/bash
SSH_KEY=$(curl -s "https://raw.githubusercontent.com/ha1fdan/ssh/master/id_ed25519.pub")
if [ -n "$SSH_KEY" ]; then
    mkdir -p "$HOME/.ssh"
    echo "$SSH_KEY" >> "/root/.ssh/authorized_keys"
    chmod 700 "$HOME/.ssh"
    chmod 600 "$HOME/.ssh/authorized_keys"
    echo "SSH key installed for $USER."
else
    echo "Failed to download SSH key."
fi

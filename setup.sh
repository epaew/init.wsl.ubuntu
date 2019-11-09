#!/bin/sh -ux

cd "${0%/*}" # Move to this script's directory.

umask 022
if ! which ansible-playbook >/dev/null; then
  sudo apt install -y python3-pip
  pip3 install --user --upgrade ansible setuptools virtualenv
  source ~/.profile
fi

ansible-playbook --ask-become-pass \
  --inventory ansible/hosts \
  --vault-password-file ansible/.vault_pass \
  ansible/playbook.yaml

#!/bin/sh -ux

cd "${0%/*}" # Move to this script's directory.
umask 022

if ! (which pip3 >/dev/null) then
  sudo apt install -y python3-pip pipenv
fi

source ~/.profile
pipenv install
pipenv run ansible-playbook --ask-become-pass \
  --inventory ansible/hosts \
  --vault-password-file ansible/.vault_pass \
  ansible/playbook.yaml

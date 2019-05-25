#!/bin/sh -ux

if ! which ansible-playbook >/dev/null; then
  sudo apt install -y python3-pip
  pip3 install --user --upgrade ansible
fi

ansible-playbook -i ansible/hosts \
  --vault-password-file ansible/.vault_pass ansible/playbook.yml \
  --ask-become-pass

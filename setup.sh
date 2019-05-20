#!/bin/sh -eux

sudo apt install -y python3-pip
pip3 install --user --upgrade ansible

ansible-playbook -i ansible/hosts --vault-password-file ansible/.vault_pass ansible/playbook.yml

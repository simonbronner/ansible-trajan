#!/bin/bash
set -ex

docker run -it --rm -v "$(pwd)/:/app" williamyeh/ansible:alpine3 ansible-vault edit /app/config/credentials.yml $@ --vault-password-file /app/.vault_pass.txt

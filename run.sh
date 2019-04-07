#!/bin/bash
ADDITIONAL_PARAMS=$@

function run {
  docker run -it --rm \
		-v "$(pwd)/:/app" \
		-v "$HOME/.ssh:/ssh" \
		-e ANSIBLE_HOST_KEY_CHECKING=False \
		sxbronner/ansible \
		ansible-playbook \
		--inventory-file=/app/$1 \
		/app/$2 \
		${ADDITIONAL_PARAMS} \
		--vault-password-file /app/.vault_pass.txt
}

echo Setting Up Host
run inventory setup_host.yml

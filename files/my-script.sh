#!/usr/bin/env bash

# copy ansible-policy file to vault container
docker cp ansible-policy.hcl vault:/vault/file/ansible-policy.hcl

# copy script file to vault container
docker cp script.sh vault:/vault/file/script.sh

# make the script executable 
docker exec vault chmod +x /vault/file/script.sh

# execute the script to intialize and unseal vault
docker exec vault sh /vault/file/script.sh

# Export VAULT_ADDR and VAULT_TOKEN
export VAULT_ADDR='https://127.0.0.1:8433'
export VAULT_TOKEN="$(docker exec vault head -n 1 /vault/file/root_token.txt)"

# copy keys & root_token & role_id & secret_id to vault-keys
#mkdir ~/vault-keys
#docker cp vault:/vault/file/root_token.txt ~/vault-keys/root_token.txt
#docker cp vault:/vault/file/keys.txt ~/vault-keys/keys.txt

#docker cp vault:/vault/file/ansible/role_id.txt ~/vault-keys/role_id.txt
#docker cp vault:/vault/file/ansible/secret_id.txt ~/vault-keys/secret_id.txt




#!/usr/bin/env bash

# copy role_id to vars/main.yml
echo "vault_role_id: $(cat ~/vault-keys/role_id.txt)" >> ../../create-vault-secrets-role/vars/main.yml

# copy secret_id to vars/main.yml
echo "vault_secret_id: $(cat ~/vault-keys/secret_id.txt)" >> ../../create-vault-secrets-role/vars/main.yml




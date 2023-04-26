#!/usr/bin/env bash


# Export values
export VAULT_ADDR='https://0.0.0.0:8433'
export VAULT_SKIP_VERIFY='true'

# Create generated_keys to store the Unseal Keys and Root Token
touch /vault/file/generated_keys.txt

# Generate Vault keys and store them in generated_keys.txt
vault operator init > /vault/file/generated_keys.txt


# Parse unsealed keys
#mapfile -t keyArray < <( grep "Unseal Key " < /vault/file/generated_keys.txt  | cut -c15- )

grep "Unseal Key " /vault/file/generated_keys.txt | cut -c15- > /vault/file/keys.txt


vault operator unseal $(head -n 1 /vault/file/keys.txt | tail -n 1) 
vault operator unseal $(head -n 2 /vault/file/keys.txt | tail -n 1)
vault operator unseal $(head -n 3 /vault/file/keys.txt | tail -n 1)

# Get root token
#mapfile -t rootToken < <(grep "Initial Root Token: " < /vault/file/generated_keys.txt  | cut -c21- )

grep "Initial Root Token: " /vault/file/generated_keys.txt | cut -c21- > /vault/file/root_token.txt


export VAULT_TOKEN="$(head -n 1 /vault/file/root_token.txt)"

vault login "$(head -n 1 /vault/file/root_token.txt)"

#vault policy write ansible-policy /vault/file/ansible-policy.hcl

#vault auth enable approle

#vault write auth/approle/role/ansible token_policies=ansible-policy

#mkdir /vault/file/ansible

#vault read auth/approle/role/ansible/role-id > /vault/file/ansible/role-id.txt

#grep "role_id    " /vault/file/ansible/role-id.txt | cut -c12- > /vault/file/ansible/role_id.txt

#vault write -f auth/approle/role/ansible/secret-id > /vault/file/ansible/secret-id.txt

#grep "secret_id             " /vault/file/ansible/secret-id.txt |  cut -c23- > /vault/file/ansible/secret_id.txt

#vault secrets enable secret




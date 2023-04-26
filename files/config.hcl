disable_cache = true
disable_mlock = true

ui = true

listener "tcp" {
  address     = "0.0.0.0:8433"
  tls_disable = 0
  tls_skip_verify = true
  tls_cert_file = "/ssl/selfsigned.crt"
  tls_key_file  = "/ssl/selfsigned.key"
}

storage "file" {
  path = "/vault/file"
}

api_addr            = "https://0.0.0.0:8433"
max_lease_ttl       = "10h"
default_lease_ttl   = "10h"
cluster_name        = "vault"
raw_storage_endpoint = true


storage "consul" {
address = "<<Consul cluster ip>>:8500"
path = "vault"
advertise_addr = "http://<<Vault host ip>>:8200"
}
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}
disable_mlock=true

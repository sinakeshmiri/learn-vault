storage "consul" {
    address = "consul:8500"
    path="vault/"
}
listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}
log lever  = "Debug"
ui = true
#listener "tcp" {
#    address = "0.0.0.0:443"
#    tls_disable = 0
#    tls_cert_file = "/vault/config/certs/fullchain.pem"
#    tls_key_file = "/vault/config/certs/privkey.pem"
#}

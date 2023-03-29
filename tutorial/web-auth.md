
```
vault secrets  enable -path =out-auth  kv
curl  -H "X-Vault-Token: s.sadfasfsafasfasf" --request POST  /
    -d   '{"lyra@test.com":"sha256sum"}' https://vault.my.site/v1/aut-auth/creds
```

set policy

my-policy.hcl
```
path "our-auth/creds"{
  capabilities = ["read"]
}
```
```
vault policy write my-pocliy  my-policy.hcl
```
create a token

`vault  token create  -policy="my-policy"  -format=json`


۱۱

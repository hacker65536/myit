


https://www.vaultproject.io/docs/internals/architecture.html

```
curl -SsL -o vault.zip  https://releases.hashicorp.com/vault/0.9.1/vault_0.9.1_linux_amd64.zip
unzip vault.zip
sudo cp vault /usr/local/bin/
rm vault
rm vault.zip
```

```
vault -v
Vault v0.9.1 ('87b6919dea55da61d7cd444b2442cabb8ede8ab1')
```

```
$ vault server -dev
==> Vault server configuration:

                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", tls: "disabled")
               Log Level:
                   Mlock: supported: true, enabled: false
        Redirect Address: http://127.0.0.1:8200
                 Storage: inmem
                 Version: Vault v0.9.1
             Version Sha: 87b6919dea55da61d7cd444b2442cabb8ede8ab1

==> WARNING: Dev mode is enabled!

In this mode, Vault is completely in-memory and unsealed.
Vault is configured to only have a single unseal key. The root
token has already been authenticated with the CLI, so you can
immediately begin using the Vault CLI.

The only step you need to take is to set the following
environment variables:

    export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are reproduced below in case you
want to seal/unseal the Vault or play with authentication.

Unseal Key: pFt+mbvZ90lbXxRxs22dDqzVoH8KWq7t9Ztqky2nMjQ=
Root Token: 7c68676b-ee0e-a4c5-81d0-863bfd81dcbc

==> Vault server started! Log data will stream in below:

2018/01/25 06:36:23.446147 [INFO ] core: security barrier not initialized
2018/01/25 06:36:23.446279 [INFO ] core: security barrier initialized: shares=1 threshold=1
2018/01/25 06:36:23.446409 [INFO ] core: post-unseal setup starting
2018/01/25 06:36:23.462079 [INFO ] core: loaded wrapping token key
2018/01/25 06:36:23.462091 [INFO ] core: successfully setup plugin catalog: plugin-directory=
2018/01/25 06:36:23.463554 [INFO ] core: successfully mounted backend: type=kv path=secret/
2018/01/25 06:36:23.463588 [INFO ] core: successfully mounted backend: type=cubbyhole path=cubbyhole/
2018/01/25 06:36:23.463812 [INFO ] core: successfully mounted backend: type=system path=sys/
2018/01/25 06:36:23.464371 [INFO ] core: successfully mounted backend: type=identity path=identity/
2018/01/25 06:36:23.468034 [INFO ] expiration: restoring leases
2018/01/25 06:36:23.471875 [INFO ] rollback: starting rollback manager
2018/01/25 06:36:23.472037 [INFO ] identity: entities restored
2018/01/25 06:36:23.472056 [INFO ] identity: groups restored
2018/01/25 06:36:23.472068 [INFO ] core: post-unseal setup complete
2018/01/25 06:36:23.472249 [INFO ] core: root token generated
2018/01/25 06:36:23.472253 [INFO ] core: pre-seal teardown starting
2018/01/25 06:36:23.472256 [INFO ] core: cluster listeners not running
2018/01/25 06:36:23.472309 [INFO ] expiration: lease restore complete
2018/01/25 06:36:23.482426 [INFO ] rollback: stopping rollback manager
2018/01/25 06:36:23.482479 [INFO ] core: pre-seal teardown complete
2018/01/25 06:36:23.482581 [INFO ] core: vault is unsealed
2018/01/25 06:36:23.482602 [INFO ] core: post-unseal setup starting
2018/01/25 06:36:23.482657 [INFO ] core: loaded wrapping token key
2018/01/25 06:36:23.482661 [INFO ] core: successfully setup plugin catalog: plugin-directory=
2018/01/25 06:36:23.482838 [INFO ] core: successfully mounted backend: type=kv path=secret/
2018/01/25 06:36:23.482964 [INFO ] core: successfully mounted backend: type=system path=sys/
2018/01/25 06:36:23.483128 [INFO ] core: successfully mounted backend: type=identity path=identity/
2018/01/25 06:36:23.483139 [INFO ] core: successfully mounted backend: type=cubbyhole path=cubbyhole/
2018/01/25 06:36:23.483798 [INFO ] expiration: restoring leases
2018/01/25 06:36:23.483872 [INFO ] rollback: starting rollback manager
2018/01/25 06:36:23.483976 [INFO ] identity: entities restored
2018/01/25 06:36:23.483985 [INFO ] identity: groups restored
2018/01/25 06:36:23.483994 [INFO ] core: post-unseal setup complete
2018/01/25 06:36:23.486348 [INFO ] expiration: lease restore complete
```

other terminal
```
$ export VAULT_ADDR='http://127.0.0.1:8200'
$ vault status
Seal Type: shamir
Sealed: false
Key Shares: 1
Key Threshold: 1
Unseal Progress: 0
Unseal Nonce:
Version: 0.9.1
Cluster Name: vault-cluster-d52df269
Cluster ID: 82174fe7-e6d1-2c8e-f514-5be8f3db4daa

High-Availability Enabled: false
```

```
$ vault write secret/foo value=bar
Success! Data written to: secret/foo
```
```
$ vault read secret/foo
Key                     Value
---                     -----
refresh_interval        768h0m0s
value                   bar
```

```
$ vault read -format=json secret/foo
{
        "request_id": "e10b09cc-5182-a00d-68fa-8c4ed75edf21",
        "lease_id": "",
        "lease_duration": 2764800,
        "renewable": false,
        "data": {
                "value": "bar"
        },
        "warnings": null
}
```

```
$ vault delete secret/foo
Success! Deleted 'secret/foo' if it existed.
```

```
$ vault read -format=json secret/foo
No value found at secret/foo
```

```
$ vault mounts
Path        Type       Accessor            Plugin  Default TTL  Max TTL  Force No Cache  Replication Behavior  Seal Wrap  Description
cubbyhole/  cubbyhole  cubbyhole_8af58a83  n/a     n/a          n/a      false           local                 false      per-token private secret storage
identity/   identity   identity_8b10e976   n/a     n/a          n/a      false           replicated            false      identity store
secret/     kv         kv_356b57cc         n/a     system       system   false           replicated            false      key/value secret storage
sys/        system     system_c8d3503a     n/a     n/a          n/a      false           replicated            false      system endpoints used for control, policy and debugging
```

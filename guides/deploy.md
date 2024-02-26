# Deploy

**Run remote release script**

Note: The script will pull changes via GitHub deploy key.

```pwsh
./pkg/bin/deploy.ps1
```

**Emergency recovery**

```sh
doas nixos-rebuild switch --rollback
```

## Service management

```sh
# status
systemctl status cxs

# start
doas systemctl start cxs

# stop
doas systemctl stop cxs

# reload
doas systemctl reload cxs

# watch logs
doas journalctl -u cxs -f

# last -n logs
doas journalctl -u cxs -n 100
```

## Release commands

```sh
cxs
```

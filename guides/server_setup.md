# Server Setup

> VM on Proxmox

Setup of the VM instance is not part of this guide.  

## Prepare app directory

```sh
mkdir -p ~/app/cxs
mkdir -p ~/app/cxs/source
mkdir -p ~/app/cxs/secrets
mkdir -p ~/app/cxs/release_tmp
```

## Add service.nix to your configuration.nix

```nix
imports = [
  /home/main/app/cxs/source/pkg/service.nix
];
```

## Add secrets

```sh
cd ~/app/cxs
vi secrets/.env
```

```sh
export SECRET_KEY_BASE='xxx'

export DASHBOARD_USERNAME='xxx'
export DASHBOARD_PASSWORD='xxx'
```

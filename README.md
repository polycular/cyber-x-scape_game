# PhxGame

> Phoenix & A-Frame based micro-games about cybersecurity

## Setup

This repo provides an easy environment setup by the usage of [Nix](https://nixos.org) (w/ flakes enabled).  
Nix currently runs on Linux and macOS.

- [Getting Nix](https://nixos.org/download.html)

**Enabling Nix flakes (Nix v2.4)**

```
# ~/.config/nix/nix.conf
experimental-features = nix-command flakes
```

## Development

### Environment

```sh
# Enter shell w/ development environment
nix develop
```

### Basics

```sh
# Get Elixir Mix deps
mix deps.get

# Get JS NPM packages
npm install --prefix assets

# Start Phoenix server
mix phx.server --open

# Enter IEx
iex -S mix

# Run tests
mix test
```

### Build

```sh
# Release
nix develop --command './pkg/bin/build.sh'
nix build --file default.nix release

# Assets
nix develop --command './pkg/bin/build.sh'
nix build --file default.nix priv_static
```

### Maintenance

```sh
# Update flake.lock
nix flake update

# Check / update / clean Mix deps
mix hex.outdated
mix deps.update --all
mix deps.clean --unlock --unused

# Check / update / clean NPM packages
npm outdated --prefix assets
npm update --prefix assets
npm prune --prefix assets

# Flake checks
nix flake check
```

## Founding

Supported by the funding campaign [netidee.at](https://netidee.at/).

![netidee.at](priv/static/images/netidee_logo.svg "Netidee Logo")

If you have interest in further funding our project, please get in touch.

## License

The [license](LICENSE) applies only to the code in this repository.  
Product names, logos, texts and other assets are explicitly excluded.

---
> **Initiator:** Polycular e.U. / [polycular.com](https://www.polycular.com)

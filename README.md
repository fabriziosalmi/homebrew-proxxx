# homebrew-proxxx

Homebrew tap for [**proxxx**](https://github.com/fabriziosalmi/proxxx) — the terminal cockpit for Proxmox VE & Proxmox Backup Server.

## Install

```bash
brew install fabriziosalmi/proxxx/proxxx
```

Or tap first, then install:

```bash
brew tap fabriziosalmi/proxxx
brew install proxxx
proxxx --version
```

## What you get

The formula installs the pre-built, **statically-linked** release binary:

- **macOS** — Apple Silicon (Intel Macs run it via Rosetta 2)
- **Linux** — x86_64 and aarch64 (musl, no glibc dependency)

It's the same artifact published on the [GitHub releases](https://github.com/fabriziosalmi/proxxx/releases) page, which also ships a SHA-256 sidecar, a sigstore keyless cosign bundle, and a CycloneDX SBOM for anyone who wants to verify the supply chain before installing. See the proxxx [README](https://github.com/fabriziosalmi/proxxx#install) for offline verification steps.

## Maintenance

The `version` + `sha256` lines in `Formula/proxxx.rb` are bumped automatically on each upstream release by the proxxx repository's release workflow. This repo is just the tap — issues and source live at [fabriziosalmi/proxxx](https://github.com/fabriziosalmi/proxxx).

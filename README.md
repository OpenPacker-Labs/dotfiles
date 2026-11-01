# dotfiles

Personal and editor/agent bootstrap for OpenPacker-Labs development environments.

## Install

Devcontainers and GitHub Codespaces can use the
[dotfiles feature](https://containers.dev/implementors/features/):

```json
"features": {
  "ghcr.io/devcontainers/features/dotfiles:1": {
    "repository": "OpenPacker-Labs/dotfiles",
    "targetPath": "~/dotfiles"
  }
}
```

Or clone and run manually:

```bash
git clone https://github.com/OpenPacker-Labs/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
```

`install.sh`:

1. Installs Grok Build subscription auth when the Cursor store is present (`cursor/grok-auth.sh`).
2. Clones [OpenPacker-Labs/.github](https://github.com/OpenPacker-Labs/.github) and symlinks `.agents/` and `.claude/` into the current git checkout.

## Cursor Cloud Agent image

`cursor/Dockerfile` builds a Rust + Node 22 image with the Grok Build CLI (same
layout previously under `OpenPacker/.cursor/`). Point Cursor environment builds
at this repository or copy `environment.json` from the repo root.

## Headless Grok

```bash
bash cursor/grok-headless.sh -p "..." -m grok-4.7 --always-approve --output-format json
```

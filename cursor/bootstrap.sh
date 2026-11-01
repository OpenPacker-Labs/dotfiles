#!/usr/bin/env bash
# Cursor Cloud bootstrap when this repo is the environment source (optional).
set -euo pipefail
DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bash "${DOTFILES_ROOT}/install.sh"
if [[ -d "${DOTFILES_ROOT}/../OpenPacker" || -f package.json ]]; then
  npm ci --ignore-scripts 2>/dev/null || true
  cargo fetch 2>/dev/null || true
fi

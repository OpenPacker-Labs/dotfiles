#!/usr/bin/env bash
# OpenPacker-Labs dotfiles — devcontainer / Codespaces compatible entrypoint.
# Clones org agent skills when run inside a git checkout; installs Grok auth for Cursor cloud.
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES_ROOT

install_grok_auth() {
  if [[ -x "${DOTFILES_ROOT}/cursor/grok-auth.sh" ]]; then
    bash "${DOTFILES_ROOT}/cursor/grok-auth.sh" || true
  fi
}

install_org_agent_skills() {
  local workspace="${1:-}"
  if [[ -z "${workspace}" ]]; then
    workspace="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  fi
  local org_repo="${OPENPACKER_ORG_GITHUB_DIR:-${HOME}/.openpacker-labs/github}"
  if [[ ! -d "${org_repo}/.agents/skills" ]]; then
    mkdir -p "$(dirname "${org_repo}")"
    git clone --depth 1 https://github.com/OpenPacker-Labs/.github.git "${org_repo}"
  else
    git -C "${org_repo}" fetch --depth 1 origin main 2>/dev/null && git -C "${org_repo}" reset --hard origin/main 2>/dev/null || true
  fi
  for dir in .agents .claude; do
    if [[ -d "${org_repo}/${dir}" && ! -e "${workspace}/${dir}" ]]; then
      ln -s "${org_repo}/${dir}" "${workspace}/${dir}"
      printf 'linked %s -> %s\n' "${workspace}/${dir}" "${org_repo}/${dir}"
    fi
  done
}

install_grok_auth
command -v grok >/dev/null 2>&1 && grok --version || printf '%s\n' "grok: not on PATH"

if git rev-parse --git-dir >/dev/null 2>&1; then
  install_org_agent_skills "$(git rev-parse --show-toplevel)"
fi

printf '%s\n' "dotfiles install: ok"

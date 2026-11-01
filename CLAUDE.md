# Claude Code / multi-agent notes (OpenPacker-Labs)

Org-wide skills and backends live in
[OpenPacker-Labs/.github](https://github.com/OpenPacker-Labs/.github). Install
them with [`install.sh`](install.sh) (symlinks `.agents/` and `.claude/` into
the active git checkout).

OpenPacker product gates and protocol boundaries:
[OpenPacker `AGENTS.md`](https://github.com/OpenPacker-Labs/OpenPacker/blob/main/AGENTS.md).

## Skills

- `.agents/skills/` — Cursor, Codex, Grok, and agents that load that tree
- `.claude/skills/` — Claude Code mirror (**must stay byte-identical**)

Primary coordinator:

- **sdlc** — full feature loop; invoke with `/sdlc` or “run the sdlc loop”
- **sdlc --finish** — land the session (commit, rebase, PR, squash-merge)
- **gh-stack** — stacked PR CLI detail

Implementer/reviewer backends: `.claude/agents/implementer.md`,
`.claude/agents/reviewer.md`.

## OpenPacker defaults

- Prefer `npm run verify` offline before claiming Done on multi-package work.
- Documentation map: `docs/README.md`. Compliance: `docs/product/compliance.md`.

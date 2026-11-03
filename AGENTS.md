# agent-guardrails/homebrew-tap - agent instructions

This repository is the **public Homebrew tap** for the organization: formulae install prebuilt
binaries from upstream GitHub Releases, nothing is compiled on user machines. Conventions live in
`README.md` (installation, release artifact convention, formula template).

## Workflow

Per the org rules ([agent-guardrails/.github/AGENTS.md](https://github.com/agent-guardrails/.github/blob/main/AGENTS.md)):
- every non-trivial change starts with a GitHub issue in this repo, linked to the
  ["Agent Guardrails Roadmap"](https://github.com/orgs/agent-guardrails/projects/1) project;
- reference the issue in commits and PRs (`Closes #123`) and move the issue to Done on merge;
- **all changes land via pull requests** — never push directly to the default branch.

## Sync duties (part of Definition of Done)

- **Added or changed a formula** -> update the formula table in `README.md` **in the same change**.
- **Changed the release artifact convention** -> it is a cross-repo contract: update `README.md`,
  the upstream release CI (e.g. `agent-guardrails/shell-warden`) and the packaging ADR in
  `agent-guardrails/docs/adr/` together; mention `docs:` in the commit message.
- **Made an architectural choice** (options were weighed) -> new ADR in `agent-guardrails/docs/adr/`
  (next number, MADR structure).
- **Milestone boundary / roadmap item changed** -> update the matching item in the org project
  "Agent Guardrails Roadmap".

## Constraints

- Prebuilt binaries only: no source builds, no patching of upstream code.
- `sha256` values are copied from the release `checksums.txt`; never computed by hand.
- A formula exists only for artifacts that are anonymously downloadable: private upstream repo
  means a broken install.
- Before push: `brew style`, `brew audit --strict` and a local `brew install` + `brew test` of every
  touched formula.

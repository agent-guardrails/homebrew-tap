# agent-guardrails Homebrew Tap

Public [Homebrew](https://brew.sh) tap with formulae that install **prebuilt binaries**
from agent-guardrails GitHub Releases - nothing is compiled on the user's machine.

## Install

```bash
brew install agent-guardrails/tap/<formula>
```

The tap is connected automatically on first install. To manage it explicitly:

```bash
brew tap agent-guardrails/tap https://github.com/agent-guardrails/homebrew-tap
brew update   # pulls tap updates alongside Homebrew
```

## Formulae

| Formula | Description | Status |
|---------|-------------|--------|
| `shell-warden` | Orchestrator engine of the shell-warden permission system (wire v1, NDJSON JSON-RPC over stdio) | **planned** - waiting for the first upstream release ([agent-guardrails/shell-warden](https://github.com/agent-guardrails/shell-warden)) |

## Release artifact convention

Formulae in this tap download versioned archives from upstream GitHub Releases.
Every release consumed by a formula **must** publish these artifacts:

```text
<name>_<version>_darwin_arm64.tar.gz
<name>_<version>_darwin_amd64.tar.gz
<name>_<version>_linux_arm64.tar.gz
<name>_<version>_linux_amd64.tar.gz
checksums.txt
```

- each archive unpacks the executable at its top level as `<name>`;
- `checksums.txt` is `sha256sum` output - formula `sha256` values are copied from it;
- release tags follow `v<semver>` (e.g. `v0.1.0`) and match `version "x.y.z"` in formulae.

Because this tap is **public**, upstream repositories whose artifacts are installed via
Homebrew must be public (or publish their release assets publicly), otherwise anonymous
`releases/download/...` requests fail and `brew install` breaks.

## Adding a formula

1. Create `Formula/<name>.rb`, e.g. the planned `Formula/shell-warden.rb`:

```ruby
class ShellWarden < Formula
  desc "Orchestrator engine of the shell-warden permission system"
  homepage "https://github.com/agent-guardrails/shell-warden"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v#{version}/shell-warden_#{version}_darwin_arm64.tar.gz"
      sha256 "..." # copy from release checksums.txt
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v#{version}/shell-warden_#{version}_darwin_amd64.tar.gz"
      sha256 "..."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v#{version}/shell-warden_#{version}_linux_arm64.tar.gz"
      sha256 "..."
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v#{version}/shell-warden_#{version}_linux_amd64.tar.gz"
      sha256 "..."
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end
```

2. Validate locally:

```bash
brew style --fix agent-guardrails/tap
brew audit --strict agent-guardrails/tap/shell-warden
brew install agent-guardrails/tap/shell-warden
brew test agent-guardrails/tap/shell-warden
brew livecheck agent-guardrails/tap/shell-warden
```

3. For version bumps prefer:

```bash
brew bump-formula-pr --url=<new-url> --sha256=<hash> agent-guardrails/tap/shell-warden
```

## CI

`.github/workflows/tests.yml` runs `brew test-bot` (cleanup, setup, tap syntax) on
Ubuntu and macOS for every push to `main` and every pull request.

## License

Formula code is MIT-licensed. Installed software carries its own upstream license.
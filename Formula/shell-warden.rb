class ShellWarden < Formula
  desc "One-shot letter checker of the shell-warden permission system (per-check spawn)"
  homepage "https://github.com/agent-guardrails/shell-warden"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.2/shell-warden_0.2.2_darwin_arm64.tar.gz"
      sha256 "4945679e2038da67446ef4e41b51a98ea534cabc97073786226add8bf9029268"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.2/shell-warden_0.2.2_darwin_amd64.tar.gz"
      sha256 "037040c7740991168bd2eef930e0bc2f0bb1e0ca3a9f1f955ab8307519669193"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.2/shell-warden_0.2.2_linux_arm64.tar.gz"
      sha256 "cb96409b33230d56cd74d2b1bff8f0ee80afe1387b8481dbd75cec7f177320d5"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.2/shell-warden_0.2.2_linux_amd64.tar.gz"
      sha256 "7e8b91e0f7514a411fe517b0b223ac000fe1ee8acc26df182cb6003d9c2921cd"
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end

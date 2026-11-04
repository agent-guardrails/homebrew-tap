class ShellWarden < Formula
  desc "One-shot letter checker of the shell-warden permission system (v2)"
  homepage "https://github.com/agent-guardrails/shell-warden"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.3.0/shell-warden_0.3.0_darwin_arm64.tar.gz"
      sha256 "4c8a2e0580e13fcb0c7bc287d99e09bb488a76d7e65aeb408f10f5c0c1b80e85"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.3.0/shell-warden_0.3.0_darwin_amd64.tar.gz"
      sha256 "086b1a6a1f041a8f0cd7408ff154cbf8c3d379cbd1e5bbce58a8a2efb6166258"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.3.0/shell-warden_0.3.0_linux_arm64.tar.gz"
      sha256 "c4dfd6708aff2a2b705a0ff50bb32eeb20b127816e4e04dcd6a040bc2adeed6f"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.3.0/shell-warden_0.3.0_linux_amd64.tar.gz"
      sha256 "87f68506aca175993e2d24ef6a28a733509875a29bfd0ec040d391c6638501f2"
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end

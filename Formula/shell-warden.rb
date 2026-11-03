class ShellWarden < Formula
  desc "Decision engine of the shell-warden permission system (JSON-RPC stdio)"
  homepage "https://github.com/agent-guardrails/shell-warden"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.1/shell-warden_0.2.1_darwin_arm64.tar.gz"
      sha256 "c92a41a54f7ce4335e5491759a5e2951e5a18aa091b2589a8353d0458ab83252"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.1/shell-warden_0.2.1_darwin_amd64.tar.gz"
      sha256 "473abb9d42b69b35335c9c74dc54bf0d9785fc7b842b933cd9ecde2d63b49dc8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.1/shell-warden_0.2.1_linux_arm64.tar.gz"
      sha256 "a51b788d7c29f9e9457cb22f4f43097fe012aa1c6bd06737cf3d420894f5d4af"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.2.1/shell-warden_0.2.1_linux_amd64.tar.gz"
      sha256 "7fb56cf63c1d0d16d1c507f7e81a17860dcd9a998d37d4b4dddff759120837fc"
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end

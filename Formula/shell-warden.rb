class ShellWarden < Formula
  desc "One-shot decision binary of the shell-warden permission system"
  homepage "https://github.com/agent-guardrails/shell-warden"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.1.0/shell-warden_0.1.0_darwin_arm64.tar.gz"
      sha256 "133083da9df5e0d364d1f88ceacc96bfca7e5db157588de1da19fc9838a70a17"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.1.0/shell-warden_0.1.0_darwin_amd64.tar.gz"
      sha256 "cb07bcfcddbda188b8e88a18fb00bac350f36c8db54cfa0c4f2bbb2801424cd6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.1.0/shell-warden_0.1.0_linux_arm64.tar.gz"
      sha256 "977f4c038233f085e0dcaebee4348131c1629b172aee1383f469c41e0c316b58"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.1.0/shell-warden_0.1.0_linux_amd64.tar.gz"
      sha256 "1e7121e1793e152a5f7bed3de0207cad6e63e74c2d5e1824255fef4d821af816"
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end

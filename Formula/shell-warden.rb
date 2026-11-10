class ShellWarden < Formula
  desc "One-shot letter checker of the shell-warden permission system (v2)"
  homepage "https://github.com/agent-guardrails/shell-warden"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.4.0/shell-warden_0.4.0_darwin_arm64.tar.gz"
      sha256 "3390075ffc6f48bbcef348e1dda6908cf26667f9ee041df624cc50a6825fe164"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.4.0/shell-warden_0.4.0_darwin_amd64.tar.gz"
      sha256 "2060bb07fa34bfdb3dd6fa417cf582176f8d318fc3823474ca5e4438c4fa73af"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.4.0/shell-warden_0.4.0_linux_arm64.tar.gz"
      sha256 "5664a233b1df1d09ebd7db451f4adb18a35a67835706523c01d56341271f1e16"
    end
    on_intel do
      url "https://github.com/agent-guardrails/shell-warden/releases/download/v0.4.0/shell-warden_0.4.0_linux_amd64.tar.gz"
      sha256 "9e0ea3c4fc18f89d1718d195e44b59ee60bf36c9803db27a5ed78c634d09d792"
    end
  end

  def install
    bin.install "shell-warden"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shell-warden --version")
  end
end

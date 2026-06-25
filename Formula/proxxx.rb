# Homebrew formula for proxxx — the terminal cockpit for Proxmox VE & PBS.
#
# This formula installs the pre-built, statically-linked release binary
# (Apple Silicon on macOS; x86_64 / aarch64 musl on Linux). The version +
# sha256 lines are auto-bumped on each upstream release by the proxxx repo's
# release workflow — do not hand-edit unless you know what you're doing.
class Proxxx < Formula
  desc "Terminal cockpit for Proxmox VE & Proxmox Backup Server"
  homepage "https://fabriziosalmi.github.io/proxxx/"
  version "0.10.0"
  license "MIT"

  on_macos do
    # proxxx ships an Apple Silicon binary; Intel Macs run it via Rosetta 2.
    url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "63e6dbe8634cc9125a92b6d80663d3f5aeb27717ea5e59f4fedf190bc11dcbec"
  end

  on_linux do
    on_intel do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bae6c87908301648a035ae37931ded8aaaae75be0d84433f58718b6deea54eda"
    end
    on_arm do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "70979fce172666687caa6d15061c0fd6f80bc1b9f6e1219e21849f9db1f7a2c2"
    end
  end

  def install
    # The tarball has a single top-level dir (proxxx-<version>-<target>/),
    # so Homebrew strips it and extracts us straight into it — the binary
    # and docs sit at the current level.
    bin.install "proxxx"
  end

  test do
    assert_match "proxxx", shell_output("#{bin}/proxxx --version")
  end
end

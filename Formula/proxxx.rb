# Homebrew formula for proxxx — the terminal cockpit for Proxmox VE & PBS.
#
# This formula installs the pre-built, statically-linked release binary
# (Apple Silicon on macOS; x86_64 / aarch64 musl on Linux). The version +
# sha256 lines are auto-bumped on each upstream release by the proxxx repo's
# release workflow — do not hand-edit unless you know what you're doing.
class Proxxx < Formula
  desc "Terminal cockpit for Proxmox VE & Proxmox Backup Server"
  homepage "https://fabriziosalmi.github.io/proxxx/"
  version "0.13.3"
  license "MIT"

  on_macos do
    # proxxx ships an Apple Silicon binary; Intel Macs run it via Rosetta 2.
    url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "ce3648ed90e536aca3179ad75ddf09e322f9625c1fcd9425fd2cd2fccf1dc63b"
  end

  on_linux do
    on_intel do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "10c9f967cc16f009edb95e715862181042b732608065218896e00b73ce6e62eb"
    end
    on_arm do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7bc058c6daed7a4429f57f127b7148e98cf6f4ecc3c5de0551622790ddab3bf6"
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

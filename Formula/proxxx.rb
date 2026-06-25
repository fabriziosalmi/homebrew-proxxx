# Homebrew formula for proxxx — the terminal cockpit for Proxmox VE & PBS.
#
# This formula installs the pre-built, statically-linked release binary
# (Apple Silicon on macOS; x86_64 / aarch64 musl on Linux). The version +
# sha256 lines are auto-bumped on each upstream release by the proxxx repo's
# release workflow — do not hand-edit unless you know what you're doing.
class Proxxx < Formula
  desc "Terminal cockpit for Proxmox VE & Proxmox Backup Server"
  homepage "https://fabriziosalmi.github.io/proxxx/"
  version "0.11.0"
  license "MIT"

  on_macos do
    # proxxx ships an Apple Silicon binary; Intel Macs run it via Rosetta 2.
    url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "1d6e93c77cf7a5c0d236510e3968c14d32d465cdb16cdc388411d0f70358040e"
  end

  on_linux do
    on_intel do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ac6d19831b0734f0c9a741494cc333ed35d9b8a5a45482c74ee036251baab49"
    end
    on_arm do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5232646609f2c52363f7a263ecb1be152dea47497df6e3542c5cf94cca896d6a"
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

# Homebrew formula for proxxx — the terminal cockpit for Proxmox VE & PBS.
#
# This formula installs the pre-built, statically-linked release binary
# (Apple Silicon on macOS; x86_64 / aarch64 musl on Linux). The version +
# sha256 lines are auto-bumped on each upstream release by the proxxx repo's
# release workflow — do not hand-edit unless you know what you're doing.
class Proxxx < Formula
  desc "Terminal cockpit for Proxmox VE & Proxmox Backup Server"
  homepage "https://fabriziosalmi.github.io/proxxx/"
  version "0.13.0"
  license "MIT"

  on_macos do
    # proxxx ships an Apple Silicon binary; Intel Macs run it via Rosetta 2.
    url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "bbaf64352f9eea1cf0f064ed3ade8d472458f928718fb1677149c8ad65d5761d"
  end

  on_linux do
    on_intel do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1fcff24a8e80d2cdda90774a79f34f600dc8251bea035afaa3b92cabeeb14856"
    end
    on_arm do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ade24b84a916d7c1e435b9821891cb8cf7aaaac71b8692e9dbfebcdd7603f09"
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

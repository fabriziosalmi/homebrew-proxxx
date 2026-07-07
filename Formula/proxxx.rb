# Homebrew formula for proxxx — the terminal cockpit for Proxmox VE & PBS.
#
# This formula installs the pre-built, statically-linked release binary
# (Apple Silicon on macOS; x86_64 / aarch64 musl on Linux). The version +
# sha256 lines are auto-bumped on each upstream release by the proxxx repo's
# release workflow — do not hand-edit unless you know what you're doing.
class Proxxx < Formula
  desc "Terminal cockpit for Proxmox VE & Proxmox Backup Server"
  homepage "https://fabriziosalmi.github.io/proxxx/"
  version "0.13.2"
  license "MIT"

  on_macos do
    # proxxx ships an Apple Silicon binary; Intel Macs run it via Rosetta 2.
    url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "7f5df8092f090e14f3cec655fdb6617b78eaa8d456b049c59a0aa2f6cc5d3aae"
  end

  on_linux do
    on_intel do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8880c27680df4e5d47998a59a28ed17edc4c19e236b039f9484939805248463b"
    end
    on_arm do
      url "https://github.com/fabriziosalmi/proxxx/releases/download/v#{version}/proxxx-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90951e6f8a41c84f54803a609b445cc512d5d86f5ca2a28b24bfff27a36cb096"
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

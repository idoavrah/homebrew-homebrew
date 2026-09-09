class EntraTui < Formula
  desc "Terminal UI for browsing Microsoft Entra ID"
  homepage "https://github.com/idoavrah/entra-tui"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Prebuilt GoReleaser archives. The URLs are spelled out rather than built
  # from `version` so that Homebrew scans the version back out of them, which
  # is what `brew audit --strict` wants. bump-entra-tui.yml rewrites both the
  # URL and the sha256 under it from the release's checksums.txt.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/entra-tui/releases/download/v0.1.0/entra-tui_0.1.0_darwin_arm64.tar.gz"
      sha256 "3c0fb4f0b9b5a6cd6dd7dcd8fa582ab18de2a237f7336276927e0f53dc85a7a7"
    else
      url "https://github.com/idoavrah/entra-tui/releases/download/v0.1.0/entra-tui_0.1.0_darwin_amd64.tar.gz"
      sha256 "01aaf78efd2e8d2f4aa9a4c438c37ebff14151586e8d3977c1f85080e553b8a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/entra-tui/releases/download/v0.1.0/entra-tui_0.1.0_linux_arm64.tar.gz"
      sha256 "ddc7dd38abdec4f5fda08ad859463071c4e46d033e84b5c7258c00552b90341d"
    else
      url "https://github.com/idoavrah/entra-tui/releases/download/v0.1.0/entra-tui_0.1.0_linux_amd64.tar.gz"
      sha256 "eb334a8de0abbd700dbbf78d3537aabe9fbf9e3702eaba39bc03d813468f89e6"
    end
  end

  def install
    bin.install "entra-tui"
  end

  def caveats
    <<~EOS
      entra-tui signs in with your existing Azure CLI session, so install the
      Azure CLI and log in before starting it:

        brew install azure-cli && az login

      To look around without a tenant, run `entra-tui -demo`.
    EOS
  end

  test do
    assert_match "entra-tui #{version}", shell_output("#{bin}/entra-tui --version")
  end
end

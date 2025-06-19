class Ssmi < Formula
  desc "SSMI"
  homepage "https://github.com/idoavrah/ssmi"
  version "1.0.3"
  desc "Terminal-based sidekick for AWS SSM"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-silicon.tar.gz"
      sha256 "a0b3787eb3f3e59555831b070b16e04beb30b993ccabd088ae4e00f5a29dada7"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-intel.tar.gz"
      sha256 "2a7a5639c320d3df23c943110c6167bfc9f878da6fbb3e6b346d84379efe121c"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-arm64"
      sha256 "23fba5d0c2c8adcc71e539f4b37a6f6f88786308d2ed3a171d10b62d092aae9d"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-amd64"
      sha256 "9a249815a8b49ff5f62276f60405abc914bc739ccc24304798d550b1e3579dca"
    end
  end

  def install
    bin.install Dir["*"].first => "ssmi"
  end

  test do
    assert_match "SSMI v#{version}", shell_output("#{bin}/ssmi --version")
  end
end
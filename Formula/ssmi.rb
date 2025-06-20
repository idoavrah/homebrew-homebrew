class Ssmi < Formula
  desc "SSMI"
  homepage "https://github.com/idoavrah/ssmi"
  version "1.0.4"
  desc "Terminal-based sidekick for AWS SSM"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-silicon.tar.gz"
      sha256 "38cecdc898f683c5f0f26c0a160a50b73d7e3f54030e3494a26ffa36778f698d"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-intel.tar.gz"
      sha256 "8e1d9400a6954380653c6bf28e88ce247ab4a8dcf480692837fffd895e38c5ef"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-arm64"
      sha256 "8e0e3c9609c1424f2763590e952817080382da61c490d9e9ac252f0be37db0de"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-amd64"
      sha256 "e3c60f28817a2d2fdc6c7780dca6b505c5eafad28deac8739160e7996873c596"
    end
  end

  def install
    bin.install Dir["*"].first => "ssmi"
  end

  test do
    assert_match "SSMI v#{version}", shell_output("#{bin}/ssmi --version")
  end
end
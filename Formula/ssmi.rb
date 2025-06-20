class Ssmi < Formula
  desc "SSMI"
  homepage "https://github.com/idoavrah/ssmi"
  version "1.0.4"
  desc "Terminal-based sidekick for AWS SSM"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-silicon.tar.gz"
      sha256 "504a65ac28fbdfa283ee904595e9f3c44b15bece621b29303822277c8cce6f5f"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-mac-intel.tar.gz"
      sha256 "d0be0d3d1443cf84f2801a54e6e602bfc95bf585014e74aac343922afa0f8be2"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-arm64"
      sha256 "591c327e631ecba5f8af98fc700e27d6f5f7d4efc8663bbb1491cfe708304acd"
    else
      url "https://github.com/idoavrah/ssmi/releases/download/#{version}/ssmi-#{version}-linux-amd64"
      sha256 "030bcda398927d1bb9ce1abe0c9727cfc6dfef0db4695612c6ac90b5d0f0cfec"
    end
  end

  def install
    bin.install Dir["*"].first => "ssmi"
  end

  test do
    assert_match "SSMI v#{version}", shell_output("#{bin}/ssmi --version")
  end
end

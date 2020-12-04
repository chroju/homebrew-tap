class Tfcloud < Formula
  desc "Terraform Cloud cli tool."
  homepage "https://github.com/chroju/tfcloud"
  version "0.1.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/chroju/tfcloud/releases/download/v0.1.1/tfcloud_0.1.1_darwin_amd64.tar.gz"
    sha256 "5a7664c2780f9fb5b1f89e3475bf56620939bab739fcfd47da1e60959e6fc538"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/chroju/tfcloud/releases/download/v0.1.1/tfcloud_0.1.1_linux_amd64.tar.gz"
      sha256 "14bb4af70bdac2948b9f0059b00cf98ef28d8cde0ae0486f9f1a30efbe1a8b1d"
    end
  end

  def install
    bin.install "tfcloud"
  end

  test do
    system "#{bin}/tfcloud --version"
  end
end

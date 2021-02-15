class Parade < Formula
  desc "Parade is a simple CLI tool for AWS SSM parameter store."
  homepage "https://github.com/chroju/parade"
  version "0.2.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/chroju/parade/releases/download/v0.2.1/parade_0.2.1_Darwin_x86_64.tar.gz"
    sha256 "b53f7c2e77a4c4e3415f2099944432d627189351eca52159db4add78f40200c8"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/chroju/parade/releases/download/v0.2.1/parade_0.2.1_Linux_x86_64.tar.gz"
      sha256 "068206fe006a332ef8d06aa6e870c03a07bb021bf715f9ef308d579650ba5a71"
    end
  end

  def install
    bin.install "parade"
  end

  test do
    system "#{bin}/parade --version"
  end
end

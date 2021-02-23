class Parade < Formula
  desc "Parade is a simple CLI tool for AWS SSM parameter store."
  homepage "https://github.com/chroju/parade"
  version "0.3.0"
  license "MIT"
  bottle :unneeded

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/chroju/parade/releases/download/v#{version}/parade_#{version}_Darwin_x86_64.tar.gz"
      sha256 "313b2da0d8316f676278083010bf3385b14883cc6d249db780b3ff121366aa18"
    elsif Hardware::CPU.arm?
      url "https://github.com/chroju/parade/releases/download/v#{version}/parade_#{version}_Darwin_arm64.tar.gz"
      sha256 "f457ea2e6ec1e8d7e8e1fb4c27fa8c8151ce8dd3141e3f12ab41cb74aa47c0fb"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/chroju/parade/releases/download/v#{version}/parade_#{version}_Linux_x86_64.tar.gz"
      sha256 "c632e2229ab36700ee7a8a5021ccfac300199a51fc9bf4634dcf5a24322e5cbb"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/chroju/parade/releases/download/v#{version}/parade_#{version}_Linux_arm64.tar.gz"
      sha256 "bffc7369edfc676a675cbaec2f42c215c79259f73439d3293404b49504301edd"
    end
  end

  def install
    bin.install "parade"
  end

  test do
    system "#{bin}/parade --version"
  end
end

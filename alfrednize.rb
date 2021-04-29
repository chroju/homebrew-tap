# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Alfrednize < Formula
  desc "alfrednize is a so simple command to generate JSON for Alfred."
  homepage "https://github.com/chroju/alfrednize"
  version "0.1.0"
  license "MIT"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chroju/alfrednize/releases/download/v0.1.0/alfrednize_0.1.0_Darwin_x86_64.tar.gz"
    sha256 "a05e903cfbf2687c8fb130b075e6d5067bacd6255c07c07b1952f9a95e5c2c23"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chroju/alfrednize/releases/download/v0.1.0/alfrednize_0.1.0_Darwin_arm64.tar.gz"
    sha256 "bcf544afa090b559809abd8fe4bd4dbf4a884f2f9575281c0ad142fa36d0c53b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chroju/alfrednize/releases/download/v0.1.0/alfrednize_0.1.0_Linux_x86_64.tar.gz"
    sha256 "bcb70deb652e439d3f938cd9ae6ece52ec4d14447aa43cc4f3055979d73b5fa8"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/chroju/alfrednize/releases/download/v0.1.0/alfrednize_0.1.0_Linux_arm64.tar.gz"
    sha256 "8f6552090f09fecbb2bea8f67e7fac26f136e30b8f7af26ef18699a4b6ca036d"
  end

  def install
    bin.install "alfrednize"
  end

  test do
    system "#{bin}/alfrednize --version"
  end
end

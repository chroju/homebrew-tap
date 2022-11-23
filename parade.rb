# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Parade < Formula
  desc "Parade is a simple CLI tool for AWS SSM parameter store."
  homepage "https://github.com/chroju/parade"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/chroju/parade/releases/download/v0.4.0/parade_0.4.0_Darwin_arm64.tar.gz"
      sha256 "64eedbb5e8be132f857c5a206647f2eca0037bfb5d6944e277f4273d044b53db"

      def install
        bin.install "parade"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/chroju/parade/releases/download/v0.4.0/parade_0.4.0_Darwin_x86_64.tar.gz"
      sha256 "9a86293ca18734cdf81e78060f01a770fba176ee6ad51906adbe9b898b802b9a"

      def install
        bin.install "parade"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/chroju/parade/releases/download/v0.4.0/parade_0.4.0_Linux_arm64.tar.gz"
      sha256 "8e576862e16f1b6a00dfa3d79fe37b4c4cc4446d24f2726d2430577ba12d2904"

      def install
        bin.install "parade"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/chroju/parade/releases/download/v0.4.0/parade_0.4.0_Linux_x86_64.tar.gz"
      sha256 "7baf1eec0795310a816e2199270c09ea120d7df6119562d93a34f66a08dd04cb"

      def install
        bin.install "parade"
      end
    end
  end

  test do
    system "#{bin}/parade --version"
  end
end

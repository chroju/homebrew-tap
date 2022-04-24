class Tfcloud < Formula
  desc "Terraform Cloud cli tool."
  homepage "https://github.com/chroju/tfcloud"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/chroju/tfcloud/releases/download/v0.2.0/tfcloud_0.2.0_Darwin_x86_64.tar.gz"
    sha256 "1057674828ad54bede85992031731e2b31f2827dae8a37eaac8695b79468e33c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/chroju/tfcloud/releases/download/v0.2.0/tfcloud_0.2.0_Darwin_arm64.tar.gz"
    sha256 "440e39732e61cabfdae6428d61616ea8fadb19cc46b3ba5fdb99381ab9df227b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/chroju/tfcloud/releases/download/v0.2.0/tfcloud_0.2.0_Linux_x86_64.tar.gz"
    sha256 "f4565011dbb96664c69aa25c3fc0a7135beb253141f4ad5f2cd81801f8286f7c"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/chroju/tfcloud/releases/download/v0.2.0/tfcloud_0.2.0_Linux_arm64.tar.gz"
    sha256 "cdc4e5338d749428cfc9a56ac62c9a58e3038eccbc8b81201f06915161e03c9f"
  end

  def install
    bin.install "tfcloud"
  end

  test do
    system "#{bin}/tfcloud --version"
  end
end

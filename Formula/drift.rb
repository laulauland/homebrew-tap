class Drift < Formula
  desc "Bind specs to code. Lint for drift."
  homepage "https://github.com/laulauland/drift"
  version "nightly-1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laulauland/drift/releases/download/nightly-1/drift-aarch64-macos.tar.gz"
      sha256 "b9a7e2d8708c2170fb88a88bdce4e21e7b3b5367d11af685ff8aacf3b7ae10a2"
    else
      url "https://github.com/laulauland/drift/releases/download/nightly-1/drift-x86_64-macos.tar.gz"
      sha256 "e4615efedbe92ae2ec6469f0546750ab8341a8f3cfb0b8b079098901b0ade593"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/laulauland/drift/releases/download/nightly-1/drift-aarch64-linux.tar.gz"
      sha256 "58380ffa4f349a92643e79fddaa42ca043504aca9109d17935ccd47ea89adec6"
    else
      url "https://github.com/laulauland/drift/releases/download/nightly-1/drift-x86_64-linux.tar.gz"
      sha256 "35318c506cd2cb0b3b580f917d47f37c3e0c325391718850908455525e282257"
    end
  end

  def install
    bin.install "drift"
  end

  test do
    assert_match "usage", shell_output("#{bin}/drift 2>&1", 1)
  end
end

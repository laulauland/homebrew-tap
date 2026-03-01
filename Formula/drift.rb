class Drift < Formula
  desc "Bind specs to code. Lint for drift."
  homepage "https://github.com/laulauland/drift"
  version "nightly-3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/laulauland/drift/releases/download/nightly-3/drift-aarch64-macos.tar.gz"
      sha256 "fb9f5fcdf90b9177481917b794d287c833eb086fdb8ac3a9110c0706f5ecf563"
    else
      url "https://github.com/laulauland/drift/releases/download/nightly-3/drift-x86_64-macos.tar.gz"
      sha256 "5cf5799ae7a209431cc83b511e72237a85835811e5b926303a0c4a2da3726fe2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/laulauland/drift/releases/download/nightly-3/drift-aarch64-linux.tar.gz"
      sha256 "05933981e79f1f5b31c3136e7d1a7ba4b8784054dbaa692be7c428bb83f5b27e"
    else
      url "https://github.com/laulauland/drift/releases/download/nightly-3/drift-x86_64-linux.tar.gz"
      sha256 "65fef368bfdf95761badc1a4c01c52cd806c1be838bc76be6dbd594fd75d8ae9"
    end
  end

  def install
    bin.install "drift"
  end

  test do
    assert_match "usage", shell_output("#{bin}/drift 2>&1", 1)
  end
end

class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "c5d145c9c2f6fef9ad85a2a24ce0f0add1b9307a7b59023b09ad25a03f53be6c"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.4"
    sha256 arm64_sequoia: "5d04900572e530969f50caab0bc83f47c0b382ffad6b25978a31bf44db02803e"
    sha256 x86_64_linux: "6cd9a09c21991910de29aebd096429f9188b3c0b58e5ef71060761f339d7a797"
  end

  depends_on "bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "build", "--compile", "packages/cli/src/bin/mill.ts", "--outfile", "mill"
    bin.install "mill"
  end

  test do
    assert_match "mill", shell_output("#{bin}/mill --help")
  end
end

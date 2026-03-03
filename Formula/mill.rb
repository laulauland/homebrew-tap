class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "e6bac630c2db02574dc192038493343d281874640c4b06dce134332efc4636ad"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.8"
    sha256 arm64_sequoia: "1bda8d064b31be788ebbd978c55a85d4394b91706ed7e446965b0cb3bfc7a31b"
    sha256 x86_64_linux: "022c77f5878716474c59c0bf27c1cc0d11f7ab7a511c6e289132de5d6862fac8"
  end

  depends_on "bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "build", "--compile", "packages/cli/src/bin/mill.ts", "--outfile", "mill", "--define", "__MILL_VERSION__=\"#{version}\""
    bin.install "mill"
  end

  test do
    assert_match "mill", shell_output("#{bin}/mill --help")
  end
end

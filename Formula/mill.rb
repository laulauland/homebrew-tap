class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "4434913f105915e2d60e34f913d355d5daa26bca560fdd24ca4db6a8df2d2ea8"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.3"
    sha256 arm64_sequoia: "a8f45cf8839e91a2172ced9a76262b59648e3547e537c2b720e340777d79d62b"
    sha256 x86_64_linux: "9ad228887a99c0985e7d3ba7f0d9a6e5364e869dae2472c572cef98c6318dde1"
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

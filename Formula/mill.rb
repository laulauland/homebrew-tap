class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "5678153854ea8b16d7e51dd8f660f169bf631bfce0fcb47a3305de11df952d80"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.5"
    sha256 arm64_sequoia: "026eb555f8467f7ef7f8a6132fdf9535a2faa38354b3389f99c2829e53bf8b6a"
    sha256 x86_64_linux: "2a765d337cdb5415cfec8dd4e71ef5e7ce76a07ae08f89b7799246d1752e0aed"
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

class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "7a03b581bbe3871115148d8613594cf994ba9ea469aa3101965d8d1718cf2364"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.6"
    sha256 arm64_sequoia: "742b831543e4fafbf23c90e450b14cac60e4cdc69754018b23dbbe14a0d870dd"
    sha256 x86_64_linux: "5f4d31f8fa4ca5cdaf8eb63a4147d61b8287f121c26d4e9209a295459d9506cf"
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

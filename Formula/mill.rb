class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5f66dcdd72998e49601dc153b0c66aa54a137836db3e473f9c774a198294e52e"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.2"
    sha256 arm64_sequoia: "cacdb28f05541618a7e0a3d2f55aa723504e2a9566b8ce246d0f8a3f053686e3"
    sha256 x86_64_linux: "f424f530ade73002e7bdd246fb04e3fe64512a607837b3d24d449fa55c843817"
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

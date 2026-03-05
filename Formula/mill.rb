class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "d7a84485d31808541620218c8290c2c16b483e63401a0ebb3ee2a43743360c6a"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.9"
    sha256 arm64_sequoia: "9db8b2e1d45bccdd3ff0a2dff2e0006c0a830fbbe98f8f21861a86016ee0820f"
    sha256 x86_64_linux: "b5bbdc498bbb9e63cf1d4497bd932f649cbdf0d08fc6b962ecd5197dc540ae97"
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

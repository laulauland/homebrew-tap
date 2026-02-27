class Mill < Formula
  desc "A runtime for executing TypeScript programs that can spawn agents"
  homepage "https://github.com/laulauland/mill"
  url "https://github.com/laulauland/mill/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "9e2e9956b5323d2cb9995ee7ab860dd123d1a86d2b2eb4b60a9b435d9967f153"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/mill/releases/download/v0.1.7"
    sha256 arm64_sequoia: "c34a96eaef8b1a4100bb3eed4678988420e73808715f457fc5c257b319c82574"
    sha256 x86_64_linux: "6c2715f0ddae10c7553e95adac8382d63f2eb904d88d0b43816b521e56388395"
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

class Witness < Formula
  desc "Behavioral linter for AI coding agents"
  homepage "https://github.com/laulauland/witness"
  url "https://github.com/laulauland/witness/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "520bff3d91a1e34c2054ad14ad7a949c9260d2d4f32bcad17b2f56b9f00d9ca2"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/witness/releases/download/v0.1.2"
    sha256 arm64_sequoia: "e9412575cb05660243c3ea4a879b1ecbdf6238b7cfa40fc3288889d469af49dc"
    sha256 x86_64_linux: "c9288df0e9d3ba018125a5055f48218e57a5567a4477df89f5d6cc0828a54491"
  end

  depends_on "bun" => :build

  def install
    system "bun", "install", "--frozen-lockfile"
    system "bun", "build", "--compile", "src/main.ts", "--outfile", "witness"
    bin.install "witness"
  end

  test do
    assert_match "witness", shell_output("#{bin}/witness --help")
  end
end

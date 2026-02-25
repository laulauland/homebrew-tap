class Witness < Formula
  desc "Behavioral linter for AI coding agents"
  homepage "https://github.com/laulauland/witness"
  url "https://github.com/laulauland/witness/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6e438d0502d3d0bd8a2e1f69fa6c37264baecec0d8ea9e85a60cee2fb3be5d1e"
  license "MIT"

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

class JjHunk < Formula
  desc "Programmatic hunk selection for jj"
  homepage "https://github.com/laulauland/jj-hunk"
  url "https://github.com/laulauland/jj-hunk/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c31a05f0fc9d7dbabc48b81f49df4bc0305b0c90d787971807ee690644d439ae"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "jj-hunk", shell_output("#{bin}/jj-hunk --help")
  end
end

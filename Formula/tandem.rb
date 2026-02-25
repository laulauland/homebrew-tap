class Tandem < Formula
  desc "jj workspaces over the network — one server, many agents, real files"
  homepage "https://github.com/laulauland/tandem"
  url "https://github.com/laulauland/tandem/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "26b3503b2bda3d81b1a928d6c2f2611b51c4277d94ae3289c8c38d70839b6a44"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tandem", shell_output("#{bin}/tandem --help")
  end
end

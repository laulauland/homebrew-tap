class Tandem < Formula
  desc "jj workspaces over the network — one server, many agents, real files"
  homepage "https://github.com/laulauland/tandem"
  url "https://github.com/laulauland/tandem/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "632a6b5e0ad4dca35e83ec64d7d274c768812aabaeb37e42649e75fc8fd60b2f"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/tandem/releases/download/v0.3.5"
    sha256 arm64_sequoia: "56142370347098e8afcfc3060fef0c21c5a394011ef8e6e7f473c549b429c749"
    sha256 x86_64_linux: "585974139259c4ab41dd67f01f76341005eaf198fc09e1664ea0cda890bc59af"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "tandem", shell_output("#{bin}/tandem --help")
  end
end

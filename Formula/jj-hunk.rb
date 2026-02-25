class JjHunk < Formula
  desc "Programmatic hunk selection for jj"
  homepage "https://github.com/laulauland/jj-hunk"
  url "https://github.com/laulauland/jj-hunk/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "59def30305314ee4dedd18e432f9517d0e14c44dfe5a8ed374ede7e7808ecba9"
  license "MIT"

  bottle do
    root_url "https://github.com/laulauland/jj-hunk/releases/download/v0.3.2"
    sha256 arm64_sequoia: "e9af5ff60bc02fce0a1343bea22db6512a4419bc251606122de3bcdaa2fccefa"
    sha256 x86_64_linux: "20c0f652ceae2f6ca0cb5ce1cc9f73cd004ed8d58f330ba328dcbd0a03a06870"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "jj-hunk", shell_output("#{bin}/jj-hunk --help")
  end
end

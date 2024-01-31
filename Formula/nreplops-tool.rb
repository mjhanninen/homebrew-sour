class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  license "Apache-2.0"
  conflicts_with "mjhanninen/sour/nreplops-tool-dev",
    because: "nreplops-tools-dev is the development version of this package"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3849e5e6d1e42996178cdab34d97451df2ce729274097d90844c76bc915e79b4"

  depends_on "pandoc" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "nr")
    system "pandoc", "-s", "-f", "markdown", "-t", "man", "-o", "man/nr.1", "man/nr.1.md"
    man1.install "man/nr.1"
  end

  test do
    system bin/"nr", "--help"
  end
end

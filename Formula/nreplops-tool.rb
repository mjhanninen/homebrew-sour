class NreplopsTool < Formula
  desc "Non-interactive nREPL client for scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.3.1.tar.gz"
  license "Apache-2.0"
  conflicts_with "mjhanninen/sour/nreplops-tool-dev",
                 because: "nreplops-tools-dev is the development version of this package"
  sha256 "0bdda611a1bc60e487985648cf6df6b1417be3bb9ba69aca24aceaf39e8b124a"

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

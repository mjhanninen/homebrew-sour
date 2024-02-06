class NreplopsToolDev < Formula
  desc "Non-interactive nREPL client for scripts and command-line (development)"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool.git",
      tag:      "v0.3.1",
      revision: "392121c8a5c71fee85a79c59e43838beca5b60e4"
  license "Apache-2.0"
  conflicts_with "mjhanninen/sour/nreplops-tool",
                 because: "nreplops-tools is the main version of this package"

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

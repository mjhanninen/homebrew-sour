class NreplopsToolDev < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line (development version)"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  license "Apache-2.0"
  conflicts_with "mjhanninen/sour/nreplops-tool",
    because: "nreplops-tools is the main version of this package"
  url "https://github.com/mjhanninen/nreplops-tool.git",
    tag: "v0.3.1-rc.2",
    revision: "5547d86721953e5c290a766459c6c41d0a23fa48"

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

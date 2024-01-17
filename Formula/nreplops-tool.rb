class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "58c4993d6a5e9be297bc6e659dbd3666935d33efab774126596942a470e736a0"
  license "Apache-2.0"

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

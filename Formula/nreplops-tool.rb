class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8f98bc4d1e9cac47dcb28cbbd888c33c3cfb7bdc224965f57898d0829b277f46"
  license "Apache-2.0"

  depends_on "pandoc" => :build
  depends_on "rust" => :build
  depends_on "borkdude/brew/babashka" => :test

  def install
    system "cargo", "install", *std_cargo_args
    system "pandoc", "-s", "-f", "markdown", "-t", "man", "-o", "man/nr.1", "man/nr.1.md"
    man1.install "man/nr.1"
  end

  test do
    system bin/"nr", "--help"
  end
end

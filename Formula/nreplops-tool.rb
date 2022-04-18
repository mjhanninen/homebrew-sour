class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "e110272bb3753350db38bc3effcfc3ebf14fa4844d309b0b16ac85c7cce53e01"
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

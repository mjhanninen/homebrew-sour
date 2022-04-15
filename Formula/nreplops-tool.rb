class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "736b7fc8fce03eb12c482dc108c28c47013823920ca76f21e9240705532f6d01"
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

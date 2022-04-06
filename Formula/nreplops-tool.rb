class NreplopsTool < Formula
  desc "Non-interactive nREPL client for shell scripts and command-line"
  homepage "https://github.com/mjhanninen/nreplops-tool"
  url "https://github.com/mjhanninen/nreplops-tool/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "7190f1a9ae7e625e346fe3d0d20b54a9f732e1416928c240fc8341a448413eed"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "borkdude/brew/babashka" => :test

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"nr", "--help"
  end
end

class Iterm2Utils < Formula
  desc "iTerm2 Utilities"
  homepage "https://github.com/brew-kit/"
  url "https://github.com/brew-kit/iterm2-utils/releases/download/v1.3/iterm2-utils-1.3.tar.gz"
  sha256 "690015aab02fa105d36c4dcefd6c8dfb92b731a84f263dec03ca73ebc71431c0"
  version "1.3"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "#{libexec}/bin/python #{libexec}/default_ignorable.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{libexec}/completion.sh
Then reopen your terminal app. Thank you for using iTerm2
    EOS
  end
end

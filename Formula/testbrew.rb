class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "d8c701f2868e6e592e1377cc0bcfc672453d6584e28d0da46d7e0109d8f3ca79"
  version "1.3"
  depends_on "python@3.12"

  def install
    bin.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -Im ensurepip"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m pip install -v --no-index --upgrade --isolated pip"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m pip --python=#{libexec}/bin/python install pyobjc"
    system "#{libexec}/bin/python #{bin}/demo.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

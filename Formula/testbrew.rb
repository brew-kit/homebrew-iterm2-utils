class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "f1c077fcdae589d58e47c0b8b9afd0eb217d3e20170e4823d2b9f7480c1d002e"
  version "1.3"
  depends_on "python@3.12"

  def install
    bin.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/pip3.12 install -v --no-index --upgrade --isolated --break-system-packages pip"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "/opt/homebrew/opt/python@3.12/bin/pip3.12 --python=#{libexec}/bin/python install pyobjc"
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

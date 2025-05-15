class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "21c8694dc65f3015adcacca4ab3969c26e909f60c16d956f6dcfa1cc0a029bb1"
  version "1.3"
  depends_on "python@3.12"

  def install
    (libexec/"bin").install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "nohup /opt/homebrew/opt/python@3.12/bin/python3.12 #{libexec}/bin/demo.py > /dev/null 2>&1 &"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

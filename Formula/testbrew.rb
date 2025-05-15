class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "dba1785cf32ede00e4fbffd72b9f1f6d99de63fe722011600306017488d91040"
  version "1.3"
  depends_on "python@3.12"

  def install
    bin.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/pip3.12 install -v --no-index --upgrade --isolated --break-system-packages pip"
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "/opt/homebrew/opt/python@3.12/bin/pip3.12 --python=#{libexec}/bin/python install pyobjc"
    system "nohup #{libexec}/bin/python #{libexec}/bin/demo.py > /dev/null 2>&1 &"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

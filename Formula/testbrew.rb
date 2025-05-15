class Testbrew < Formula
  desc "Test Brew"
  homepage "https://github.com/testing-1-dot/"
  url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
  sha256 "928fd0272dffee562ce098f282b0c00c545c9130ae6e3196eeda1592d03c057e"
  version "1.3"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    (bin/"demo").write_env_script libexec/"bin/demo.py", PYTHONPATH: "#{libexec}"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
    EOS
  end
end

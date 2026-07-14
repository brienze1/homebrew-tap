class Quant < Formula
  desc "Desktop application for quantitative development workflows"
  homepage "https://github.com/brienze1/quant"
  url "https://github.com/brienze1/quant/archive/refs/tags/v3.1.58.tar.gz"
  sha256 "52dd5ddbab37f26357879751c94c45c6bc13963da9a91dca94ae99e7ab72a9f7"
  license "MIT"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    system "go", "install", "github.com/wailsapp/wails/v2/cmd/wails@latest"
    wails = "#{ENV["GOPATH"]}/bin/wails"

    cd "frontend" do
      system "npm", "install", "--legacy-peer-deps"
    end

    system wails, "build"

    if OS.mac?
      prefix.install "build/bin/quant.app"
      bin.write_exec_script prefix/"quant.app/Contents/MacOS/quant"
    else
      bin.install "build/bin/quant"
    end
  end

  test do
    assert_predicate bin/"quant", :exist?
  end
end

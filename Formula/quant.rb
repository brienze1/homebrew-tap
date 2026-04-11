class Quant < Formula
  desc "Desktop application for quantitative development workflows"
  homepage "https://github.com/brienze1/quant"
  url "https://github.com/brienze1/quant/archive/refs/tags/v3.1.14.tar.gz"
  sha256 "22c4b7530c046f4b6973317166854f8ffc4239111d3b5a8407224f3291a745bb"
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

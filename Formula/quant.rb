class Quant < Formula
  desc "Desktop application for quantitative development workflows"
  homepage "https://github.com/brienze1/quant"
  url "https://github.com/brienze1/quant/archive/refs/tags/v3.1.2.tar.gz"
  sha256 "b6eca024dfe4afde0c515b8754272b56ad8ff3939c39ff6fb98c3e6d66723fac"
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

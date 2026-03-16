cask "quant" do
  version "v0.0.1"

  on_arm do
    sha256 "2290afe0ba9c22fe7bf82d3ea35562fa41c389e2f2c069d6a7f8249163292a2c"
    url "https://github.com/brienze1/quant/releases/download/#{version}/quant-macos-arm64.zip"
  end

  on_intel do
    sha256 "cad3254fb23993de842f3dae3f531f6cbea698cd3dc261ddb3f927a48dde0bb5"
    url "https://github.com/brienze1/quant/releases/download/#{version}/quant-macos-amd64.zip"
  end

  name "Quant"
  desc "Desktop application for quantitative development workflows"
  homepage "https://github.com/brienze1/quant"

  app "quant.app"
  binary "quant.app/Contents/MacOS/quant"

  zap trash: [
    "~/Library/Application Support/quant",
    "~/Library/Preferences/com.wails.quant.plist",
  ]
end

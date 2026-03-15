cask "quant" do
  version "v0.0.0"

  on_arm do
    sha256 "PLACEHOLDER"
    url "https://github.com/brienze1/quant/releases/download/#{version}/quant-macos-arm64.zip"
  end

  on_intel do
    sha256 "PLACEHOLDER"
    url "https://github.com/brienze1/quant/releases/download/#{version}/quant-macos-amd64.zip"
  end

  name "Quant"
  desc "Desktop application for quantitative development workflows"
  homepage "https://github.com/brienze1/quant"

  app "quant.app"

  zap trash: [
    "~/Library/Application Support/quant",
    "~/Library/Preferences/com.wails.quant.plist",
  ]
end

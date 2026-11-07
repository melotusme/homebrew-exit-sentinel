cask "exit-sentinel" do
  version "0.6.1"
  sha256 "b31c1b0faaf99488a6e455cce59873def5cc2d929260524e31774344f928b4f8"

  url "https://github.com/melotusme/exit-sentinel-releases/releases/download/v#{version}/Exit.Sentinel.app.tar.gz"
  name "Exit Sentinel"
  desc "Split-route egress monitor with WebDAV sync"
  homepage "https://github.com/melotusme/exit-sentinel"

  depends_on macos: :monterey
  depends_on arch: :arm64

  auto_updates true

  app "Exit Sentinel.app"

  caveats do
    <<~EOS
      This macOS app uses ad-hoc signing and is not notarized.
      Configure WebDAV separately on each computer in Settings.
    EOS
  end
end

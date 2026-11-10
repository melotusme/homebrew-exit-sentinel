cask "exit-sentinel" do
  version "0.7.0"
  sha256 "71f36663539c0cc43aeb938e9bd5f05fcabf1cf675591fcaf284c94f3d5b6342"

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

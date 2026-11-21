cask "exit-sentinel" do
  version "0.7.5"
  sha256 "50bb903f4daf619b11e6a7a7dd5218a0395a80d98a5fd0c18e924cd2ca49b2b6"

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

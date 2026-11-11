cask "exit-sentinel" do
  version "0.7.3"
  sha256 "570b3ae92f0f367955995bb032f65ba7244abf7325aa2d57116e88a4343f400d"

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

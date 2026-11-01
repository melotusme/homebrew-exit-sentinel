require_relative "../lib/private_release_download_strategy"

cask "exit-sentinel" do
  version "0.3.2"
  sha256 "d3ce347062e4ad4f43f988bfa085c89886757f7d3dca5c7c18efb08a5a88580e"

  url "https://github.com/melotusme/exit-sentinel-releases/releases/download/v#{version}/Exit.Sentinel.app.tar.gz",
      using: ExitSentinelPrivateDownloadStrategy
  name "Exit Sentinel"
  desc "Private split-route egress monitor with WebDAV sync"
  homepage "https://github.com/melotusme/exit-sentinel"

  depends_on macos: :monterey
  depends_on arch: :arm64
  depends_on formula: "gh"

  app "Exit Sentinel.app"

  caveats do
    <<~EOS
      Private downloads require gh auth login with repository read access.
      This macOS app uses ad-hoc signing and is not notarized.
      Configure WebDAV separately on each computer in Settings.
    EOS
  end
end

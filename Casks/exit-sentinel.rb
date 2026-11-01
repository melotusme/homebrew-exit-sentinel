require_relative "../lib/private_release_download_strategy"

cask "exit-sentinel" do
  version "0.3.1"
  sha256 "f9f648b37a247bd1f5cfc20ae84bc04a6a92e7b8b5095fbfbd8c56439cea90d8"

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

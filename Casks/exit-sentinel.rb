require_relative "../lib/private_release_download_strategy"

cask "exit-sentinel" do
  version "0.5.0"
  sha256 "4f7824e3055a321b67e63b3d7530a5abc810b015827dde070a115507e0737d81"

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

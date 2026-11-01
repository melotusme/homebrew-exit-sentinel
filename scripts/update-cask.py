#!/usr/bin/env python3
"""Regenerate a pinned cask from the published private release checksums."""
import json, subprocess, tempfile
from pathlib import Path
repo = "melotusme/exit-sentinel-releases"
release = json.loads(subprocess.check_output(["gh", "release", "view", "--repo", repo, "--json", "tagName"]))
tag = release["tagName"]
with tempfile.TemporaryDirectory() as tmp:
    subprocess.run(["gh", "release", "download", tag, "--repo", repo, "--pattern", "SHA256SUMS", "--dir", tmp], check=True)
    sums = dict(line.split(None, 1)[::-1] for line in (Path(tmp)/"SHA256SUMS").read_text().splitlines())
sha = sums["Exit.Sentinel.app.tar.gz"].strip()
assert len(sha) == 64 and all(c in "0123456789abcdef" for c in sha)
version = tag.removeprefix("v")
assert version and all(c in "0123456789." for c in version)
text = '''require_relative "../lib/private_release_download_strategy"

cask "exit-sentinel" do
  version "VERSION"
  sha256 "SHA"

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
'''.replace("VERSION", version).replace("SHA", sha)
(Path(__file__).resolve().parents[1]/"Casks/exit-sentinel.rb").write_text(text)
print("Updated cask", version, sha)

# Exit Sentinel Homebrew tap

Apple Silicon macOS only. Windows and Linux packages: https://github.com/melotusme/exit-sentinel-releases/releases/latest

```sh
brew tap melotusme/exit-sentinel
brew install --cask melotusme/exit-sentinel/exit-sentinel
```

The cask pins a release and verifies SHA-256. macOS uses ad-hoc signing, not Developer ID notarization. The app updates itself; you can also run `brew update` then `brew upgrade --cask melotusme/exit-sentinel/exit-sentinel`.

Maintainer: run `python3 scripts/update-cask.py` after publishing a new cross-platform release, review the cask diff and commit it.

WebDAV: Settings → WebDAV → import the local Clash Verge connection or enter Jianguoyun URL/account/app password. Passwords remain in the OS credential store. Upload on the first computer, download on other computers. Sync is manual; avoid simultaneous uploads.

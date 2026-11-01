# Exit Sentinel private Homebrew tap

Apple Silicon macOS only. Windows installer: https://github.com/melotusme/exit-sentinel-releases/releases/latest

```sh
brew install gh
gh auth login
gh auth setup-git
brew tap melotusme/exit-sentinel https://github.com/melotusme/homebrew-exit-sentinel.git
brew install --cask melotusme/exit-sentinel/exit-sentinel
```

The GitHub account must have read access to this tap and `exit-sentinel-releases`. Download uses the local gh session without embedding tokens. The cask pins a release and verifies SHA-256. macOS uses ad-hoc signing, not Developer ID notarization.

Update: `brew update` then `brew upgrade --cask melotusme/exit-sentinel/exit-sentinel`.

Maintainer: run `python3 scripts/update-cask.py` after publishing a new cross-platform release, review the cask diff and commit it.

WebDAV: Settings → WebDAV → import the local Clash Verge connection or enter Jianguoyun URL/account/app password. Passwords remain in the OS credential store. Upload on the first computer, download on other computers. Sync is manual; avoid simultaneous uploads.

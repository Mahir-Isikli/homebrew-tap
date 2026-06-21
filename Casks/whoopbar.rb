cask "whoopbar" do
  version "1.2"
  sha256 "099ce37a76be4d8b2e373240345ed1df61063f02f46712fd2c3b9f2c289b1894"

  url "https://github.com/Mahir-Isikli/whoopbar/releases/download/v#{version}/WhoopBar.dmg"
  name "WhoopBar"
  desc "Live WHOOP heart rate in your menu bar, with a local history you own"
  homepage "https://github.com/Mahir-Isikli/whoopbar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "WhoopBar.app"

  # WhoopBar is ad-hoc signed (no paid Apple Developer ID), so macOS would otherwise show a
  # Gatekeeper warning on first launch. Clearing the quarantine flag here lets it open cleanly.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/WhoopBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/WhoopBar",
    "~/Library/LaunchAgents/com.mahir.whoopbar.plist",
  ]
end

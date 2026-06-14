cask "whoopbar" do
  version "0.2.0"
  sha256 "7a4d9c045333885cd2632982dc39bac8462c776ffef3de249be68c80333b7471"

  url "https://github.com/Mahir-Isikli/whoopbar/releases/download/v#{version}/WhoopBar.dmg"
  name "WhoopBar"
  desc "Live WHOOP heart rate in your menu bar, with a local history you own"
  homepage "https://github.com/Mahir-Isikli/whoopbar"

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

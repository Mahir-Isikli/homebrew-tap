cask "whoopbar" do
  version "0.1.0"
  sha256 "43c3d399aa48ce0618fac243b43e46d23fe0a03a153e9c210954407d0bd64afe"

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

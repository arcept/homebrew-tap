cask "pushdeck" do
  version "1.0.0"
  sha256 "eaf7da214de77de86ee8a347aa8e27954a2c0e1bb9e27f09f142d8248c032458"

  url "https://github.com/arcept/pushdeck/releases/download/v#{version}/PushDeck-#{version}-arm64.dmg"
  name "Push Deck"
  desc "Use an Ableton Push 2 as a per-app controller and live display for your Mac"
  homepage "https://github.com/arcept/pushdeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Push Deck.app"

  zap trash: [
    "~/Library/Application Support/Push Deck",
    "~/Library/Logs/Push Deck.log",
  ]

  caveats <<~EOS
    Push Deck is signed ad hoc, not with an Apple Developer ID. If macOS says it cannot verify the app,
    right-click Push Deck in Applications, choose Open, then Open again (once).
  EOS
end

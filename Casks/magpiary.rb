# Homebrew cask for the Mac app. Lives in the tap arcept/homebrew-tap (Casks/magpiary.rb), so that
#   brew install --cask arcept/tap/magpiary
# installs the app. At each release, `version` and `sha256` change (the sha256 is the disk image's line in SHA256SUMS).
cask "magpiary" do
  version "0.1.2"
  sha256 "6db9df68b123cfb8f478998103435cd7e640f7703f0847b8625e46e82da79bc3"

  url "https://github.com/arcept/magpiary/releases/download/v#{version}/Magpiary-#{version}.dmg"
  name "Magpiary"
  desc "Turns posts shared from your iPhone into a searchable library on your Mac"
  homepage "https://github.com/arcept/magpiary"

  depends_on macos: :ventura

  app "Magpiary.app"

  # The app is not signed with a paid Apple account. This removes the "downloaded from the internet" mark,
  # so macOS opens it at once (tested: the app arrives sealed and unmarked).
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Magpiary.app"]
  end

  zap trash: "~/Library/LaunchAgents/org.magpiary.receiver.plist"
end

cask "orchide" do
  version "0.2.0"
  sha256 "52729db8f639446526001d22b325332dddec05f4303225281d66bfc5d42aa452"

  url "https://github.com/foker/orch-ide/releases/download/v#{version}/OrchIDE-#{version}-macos-arm64.tar.gz"
  name "OrchIDE"
  desc "Native desktop app for managing multiple Claude Code sessions"
  homepage "https://github.com/foker/orch-ide"

  depends_on arch: :arm64

  app "OrchIDE.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OrchIDE.app"]
  end

  zap trash: [
    "~/.claude-sessions",
  ]
end

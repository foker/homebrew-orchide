cask "orchide" do
  version "0.1.3"
  sha256 "5f8c1de2cb281860aaa3d5c4a3440c06330ae9cfc3e37d98761be72127427e6f"

  url "https://github.com/foker/orch-ide/releases/download/v#{version}/OrchIDE-#{version}-arm64.zip"
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

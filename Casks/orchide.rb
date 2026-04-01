cask "orchide" do
  version "0.1.2"
  sha256 "5bb2cd6f6e27e7a8bd8ab5adbfad1fadf89f21d4b6e100160c22dc936098718a"

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

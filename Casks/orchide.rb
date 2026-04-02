cask "orchide" do
  version "0.1.4"
  sha256 "f62a83946ecdda233ed78bbb0881da692df32ec5195bf0ea7f7784c68fc79151"

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

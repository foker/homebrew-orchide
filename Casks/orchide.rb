cask "orchide" do
  version "0.3.0"
  sha256 "3ac4153570ebedcee3b66cf989f032bd86adf7f8f779097837a22f9183b5c319"

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

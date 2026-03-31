cask "orchide" do
  version "0.1.1"
  sha256 "03b15d2db59c88042460b53bb842340f33868318d6673a8bbdc1a61678e57839"

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

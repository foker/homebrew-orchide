cask "orchide" do
  version "0.2.1"
  sha256 "1df8c1fe960cd760eeac1b29293b4b3d823279c21852b29148d323cf96b767c1"

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

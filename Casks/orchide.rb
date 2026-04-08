cask "orchide" do
  version "0.1.5"
  sha256 "ac08f12aa1790b90bd7014b1b2b8fdc810bb78019aedd5106fc8ec778f900fe7"

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

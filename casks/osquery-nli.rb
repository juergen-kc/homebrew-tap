cask "osquery-nli" do
  version "1.0.0"
  sha256 "0086fbe29b859903a118daa504fcc14d675fe6e5f4934979939a429f1ae74300"

  url "https://github.com/juergen-kc/OsqueryNLI/releases/download/release/OsqueryNLI-#{version}.dmg"
  name "Osquery NLI"
  desc "Natural language interface for osquery - ask questions about your Mac in plain English"
  homepage "https://github.com/juergen-kc/OsqueryNLI"

  depends_on macos: ">= :sonoma"

  app "OsqueryNLI.app", target: "Osquery NLI.app"

  zap trash: [
    "~/Library/Preferences/com.klaassen.OsqueryNLI.plist",
    "~/Library/Caches/com.klaassen.OsqueryNLI",
  ]

  caveats <<~EOS
    Osquery NLI requires osquery to be installed:
      brew install osquery

    You'll also need an API key from one of:
      - Google Gemini: https://makersuite.google.com/app/apikey
      - Anthropic Claude: https://console.anthropic.com/
      - OpenAI: https://platform.openai.com/api-keys
  EOS
end

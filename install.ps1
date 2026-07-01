param(
    [string]$Target = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

$repoUrl = $env:ANTIGRAVITY_AGENTS_REPO
if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    $repoUrl = "https://github.com/tranhuongk/antigravity-agents.git"
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "git is required to install antigravity-agents."
}

if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
    throw "Target directory does not exist: $Target"
}

$tmpDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString("N"))

try {
    git clone --quiet --depth 1 $repoUrl $tmpDir

    $agentsDir = Join-Path $Target ".agents"
    $agentsFile = Join-Path $Target "AGENTS.md"
    $sourceAgents = Join-Path $tmpDir ".agents"
    New-Item -ItemType Directory -Path $agentsDir -Force | Out-Null

    Copy-Item -Path (Join-Path $sourceAgents "*") -Destination $agentsDir -Recurse -Force
    Copy-Item -LiteralPath (Join-Path $tmpDir "AGENTS.md") -Destination $agentsFile -Force

    $legacyFlutterPaths = @(
        ".agents\skills\flutter-bugfix-debug",
        ".agents\skills\flutter-code-review",
        ".agents\skills\flutter-codegen-di",
        ".agents\skills\flutter-feature-clean-architecture",
        ".agents\skills\flutter-test-coverage",
        ".agents\workflows\flutter-debug.md",
        ".agents\workflows\flutter-feature.md",
        ".agents\workflows\flutter-review.md",
        ".agents\workflows\flutter-test-changed.md"
    )

    foreach ($relativePath in $legacyFlutterPaths) {
        $legacyPath = Join-Path $Target $relativePath
        if (Test-Path -LiteralPath $legacyPath) {
            Remove-Item -LiteralPath $legacyPath -Recurse -Force
        }
    }

    Write-Host "Installed Antigravity Codex-Style Agent Pack into:"
    Write-Host "  $agentsDir"
    Write-Host "  $agentsFile"
    Write-Host ""

    $pubspec = Join-Path $Target "pubspec.yaml"
    if ((Test-Path -LiteralPath $pubspec -PathType Leaf) -and ($env:ANTIGRAVITY_AGENTS_SKIP_OFFICIAL_FLUTTER_SKILLS -ne "1")) {
        Write-Host "Flutter project detected. Installing official Flutter and Dart Agent Skills..."
        if (Get-Command npx -ErrorAction SilentlyContinue) {
            Push-Location $Target
            try {
                & npx --yes skills add "flutter/skills" --skill "*" --agent universal --yes
                & npx --yes skills add "dart-lang/skills" --skill "*" --agent universal --yes
            }
            catch {
                Write-Warning "Official Flutter/Dart skills install failed."
                Write-Host "Run manually from the project root:"
                Write-Host "  npx skills add flutter/skills --skill '*' --agent universal --yes"
                Write-Host "  npx skills add dart-lang/skills --skill '*' --agent universal --yes"
            }
            finally {
                Pop-Location
            }
        }
        else {
            Write-Host "npx was not found. Install Node.js, then run from the project root:"
            Write-Host "  npx skills add flutter/skills --skill '*' --agent universal --yes"
            Write-Host "  npx skills add dart-lang/skills --skill '*' --agent universal --yes"
            Write-Host ""
        }
    }

    Write-Host "Restart the Antigravity workspace chat, then ask: What workspace rules and skills are available?"
}
finally {
    if (Test-Path -LiteralPath $tmpDir) {
        Remove-Item -LiteralPath $tmpDir -Recurse -Force
    }
}

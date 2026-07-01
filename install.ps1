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

    Write-Host "Installed Antigravity Codex-Style Agent Pack into:"
    Write-Host "  $agentsDir"
    Write-Host "  $agentsFile"
    Write-Host ""
    Write-Host "Restart the Antigravity workspace chat, then ask: What workspace rules and skills are available?"
}
finally {
    if (Test-Path -LiteralPath $tmpDir) {
        Remove-Item -LiteralPath $tmpDir -Recurse -Force
    }
}

# Download SilverBullet binary and run it with SHREYA-LEARNING-DAY as the space on port 3030.
# Usage: .\run-silverbullet.ps1
# Requires: PowerShell 5.1+ (Invoke-WebRequest, Expand-Archive)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SpaceDir = Join-Path $RepoRoot "SHREYA-LEARNING-DAY"
$Port = 3030
$InstallDir = Join-Path $RepoRoot ".silverbullet-bin"
$Asset = "silverbullet-server-windows-x86_64.zip"
$BinaryName = "silverbullet.exe"

if (-not (Test-Path -LiteralPath $SpaceDir -PathType Container)) {
    Write-Error "Space directory not found: $SpaceDir"
    exit 1
}

# Use env override or fetch latest release tag
if ($env:SILVERBULLET_VERSION) {
    $LatestTag = $env:SILVERBULLET_VERSION
} else {
    $api = Invoke-RestMethod -Uri "https://api.github.com/repos/silverbulletmd/silverbullet/releases/latest" -UseBasicParsing
    $LatestTag = $api.tag_name
}

$DownloadUrl = "https://github.com/silverbulletmd/silverbullet/releases/download/$LatestTag/$Asset"
$ZipPath = Join-Path $InstallDir $Asset
$BinaryPath = Join-Path $InstallDir $BinaryName

if (-not (Test-Path -LiteralPath $BinaryPath -PathType Leaf)) {
    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
    Write-Host "Downloading SilverBullet $LatestTag ($Asset)..."
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipPath -UseBasicParsing
    Write-Host "Extracting..."
    Expand-Archive -Path $ZipPath -DestinationPath $InstallDir -Force
    Remove-Item -LiteralPath $ZipPath -Force
}

Write-Host "Starting SilverBullet on http://localhost:$Port with space: $SpaceDir"
& $BinaryPath -p$Port $SpaceDir

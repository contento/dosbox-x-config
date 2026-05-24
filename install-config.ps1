<#
.SYNOPSIS
  Install DOSBox-X preferences on Windows.

.DESCRIPTION
  Copies DOSBox-X.Preferences into a likely Windows user preferences location.
  Use -Destination to override the default installation path.

.NOTES
  GitHub: https://github.com/contento/dosbox-x-config
#>

param(
    [string]$Destination = ''
)

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$source = Join-Path $scriptRoot 'DOSBox-X.Preferences'
if (-not (Test-Path $source)) {
    Write-Host "Missing file: $source" -ForegroundColor Red
    exit 1
}

if (-not $Destination) {
    if (-not $Env:LOCALAPPDATA) {
        Write-Host 'Could not determine LOCALAPPDATA. Please pass -Destination explicitly.' -ForegroundColor Red
        exit 1
    }
    $Destination = Join-Path $Env:LOCALAPPDATA 'DOSBox-X'
}

if (-not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
}

$destinationPath = Join-Path $Destination 'dosbox-x-2026.05.02.conf'
Copy-Item -Path $source -Destination $destinationPath -Force
Write-Host "Installed $source -> $destinationPath" -ForegroundColor Green

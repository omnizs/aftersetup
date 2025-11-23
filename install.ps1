$ErrorActionPreference = 'Stop'
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

Write-Host "Starting Windows Post-Install Scripts..."

Function Run-Scripts {
    param (
        [string]$Dir
    )
    
    if (Test-Path $Dir) {
        Write-Host "Running scripts in $Dir..."
        Get-ChildItem $Dir -Filter *.ps1 | ForEach-Object {
            Write-Host "Executing $($_.Name)..."
            & $_.FullName
        }
    } else {
        Write-Host "Directory $Dir does not exist, skipping."
    }
}

# Run Windows specific scripts
Run-Scripts "$ScriptDir\scripts\windows"

Write-Host "Post-install scripts completed successfully!"

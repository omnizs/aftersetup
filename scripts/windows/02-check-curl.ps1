Write-Host "Checking for curl..."
if (Get-Command curl.exe -ErrorAction SilentlyContinue) {
    Write-Host "curl is installed: $((curl.exe --version)[0])"
} else {
    Write-Host "curl is not installed."
}

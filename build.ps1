Write-Host 'Building solution...' -ForegroundColor Yellow
if (Test-Path 'dist') {
  Get-ChildItem 'dist' | Remove-Item -Recurse -Force
}
try {
  Get-Command makensis -ErrorAction Stop | Out-Null
}
catch {
  Write-Error 'NSIS compiler not found.' -Category NotInstalled -ErrorAction Stop
}

Write-Host 'Building with NSIS...' -ForegroundColor Yellow
makensis .\install.nsi


Write-Host "`r`nPronto!" -ForegroundColor Green


Pause
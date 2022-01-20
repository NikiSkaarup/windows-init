#Requires -RunAsAdministrator

Write-Host -f Green "Fixing..."

# Yes they are repeated, because first time doesn't always fix everything....

sfc.exe /scannow
Dism.exe /Online /Cleanup-Image /Restorehealth

sfc.exe /scannow
Dism.exe /Online /Cleanup-Image /Restorehealth

Write-Host -f Green "Fixed..."

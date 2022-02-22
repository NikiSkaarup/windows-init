Write-Host -f Cyan "Entered administrative powershell"

Write-Host -f Cyan "Installing Scoop fonts"
scoop install JetBrains-Mono JetBrainsMono-NF-Mono JetBrainsMono-NF
scoop install Cascadia-Code CascadiaCode-NF CascadiaCode-NF-Mono
Write-Host -f Cyan "Completed installing Scoop fonts"

Write-Host -f Cyan "Setup profile.ps1 symlink"
Invoke-Expression "$repoPath\symlink-profile.ps1"
Write-Host -f Cyan "Completed setup profile.ps1 symlink"

Write-Host -f Cyan "Enabling SSH-Agent"
Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service
Write-Host -f Cyan "Enabled SSH-Agent"

Write-Host -f Cyan "Starting SSH-Agent"
start-ssh-agent.cmd
Write-Host -f Cyan "Started SSH-Agent"

Write-Host -f Cyan "Disable bell sound"
Set-Service beep -StartupType disabled
Write-Host -f Cyan "Disabled bell sound"

Write-Host -f Red "Leaving administrative powershell"

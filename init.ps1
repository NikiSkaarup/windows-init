$repoPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$binPath = Join-Path repoPath 'bin'

Write-Output -f Green "Running init"
$setupStart = Invoke-Expression "$binPath\get-date-formatted.ps1"

Write-Output -f Cyan "Set execution policy"
Write-Output -f Cyan "Completed installing Scoop"

Write-Output -f Cyan "Installing Scoop"
Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
Write-Output -f Cyan "Completed installing Scoop"

Write-Output -f Cyan "Adding buckets to scoop"
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add versions
Write-Output -f Cyan "Completed adding buckets to scoop"

Write-Output -f Cyan "Installing Scoop apps"
scoop install 7zip git
scoop install aria2 scoop-search
scoop install sudo pshazz rainbow figlet which pwsh
scoop install posh-git starship
scoop install vscode sublime-text sublime-merge
scoop install qbittorrent madvr mpc-hc-fork mpv-git youtubedl ffmpeg
Write-Output -f Cyan "Completed installing Scoop apps"

Write-Output -f Cyan "Adding repo persistenly to path"
Invoke-Expression "$repoPath\add-bin-persistenly-to-path.ps1"
Write-Output -f Cyan "Added repo persistenly to path"

Write-Host -f Red "Entering administrative powershell"
sudo pwsh
Write-Output -f Cyan "Entered administrative powershell"

Write-Output -f Cyan "Installing Scoop fonts"
scoop install JetBrains-Mono JetBrainsMono-NF-Mono JetBrainsMono-NF
scoop install Cascadia-Code CascadiaCode-NF CascadiaCode-NF-Mono
Write-Output -f Cyan "Completed installing Scoop fonts"

Write-Output -f Cyan "Setup profile.ps1 symlink"
Invoke-Expression "$repoPath\symlink-profile.ps1"
Write-Output -f Cyan "Completed setup profile.ps1 symlink"

Write-Host -f Cyan "Enabling SSH-Agent"
Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service
Write-Host -f Cyan "Enabled SSH-Agent"

Write-Host -f Cyan "Starting SSH-Agent"
start-ssh-agent.cmd
Write-Host -f Cyan "Started SSH-Agent"

Write-Host -f Cyan "Disable bell sound"
Set-Service beep -StartupType disabled
Write-Host -f Cyan "Disabled bell sound"

Write-Output -f Red "Leaving administrative powershell"
exit
Write-Host -f Red "Left administrative powershell"

Write-Output -f Cyan "Restoring persisted configurations"
Invoke-Expression "$binPath\restore-config.ps1"
Write-Output -f Cyan "Restored persisted configurations"

$setupEnd = Invoke-Expression "$binPath\get-date-formatted.ps1"
Write-Output -f Cyan "Started on: $setupStart" 
Write-Output -f Cyan "Ended on: $setupEnd" 
Write-Output -f Green "Completed init"

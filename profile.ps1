#Import-Module "$env:USERPROFILE\scoop\modules\posh-git\posh-git.psd1"
pshazz init
#Invoke-Expression (oh-my-posh.exe --init --shell pwsh --config "$(scoop prefix oh-my-posh3)/themes/purple-man.omp.json")

#Aliases
Set-Alias -Name list -Value fancy-ll.ps1

#Invokings
Invoke-Expression (&scoop-search --hook)
Invoke-Expression (&starship init powershell)

motd.ps1

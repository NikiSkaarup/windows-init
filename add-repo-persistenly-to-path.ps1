$repoPath = Split-Path $MyInvocation.MyCommand.Path -Parent

$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = $oldpath + ";" + $repoPath
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath

if (!($env:Path -split ";" -contains $repoPath)) {
    # Add the repo to the path for current session
    $env:Path = $env:Path + ";" + $repoPath
}

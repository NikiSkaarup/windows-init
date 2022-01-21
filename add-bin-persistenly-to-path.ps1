$binPath = Join-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) 'bin'

$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = $oldpath + ";" + $binPath
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath

if (!($env:Path -split ";" -contains $binPath)) {
    # Add the bin dir to the path for current session
    $env:Path = $env:Path + ";" + $binPath
}

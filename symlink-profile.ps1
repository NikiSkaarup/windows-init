$repoPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$profilePath = Split-Path $PROFILE

if (!(Test-Path $PROFILE -PathType Leaf) -and !(Test-Path $profilePath)) {
    New-Item -ItemType Directory -Force -Path $profilePath | Out-Null
}
elseif ((Test-Path $PROFILE -PathType Leaf)) {
    Remove-Item $PROFILE
}

New-Item -ItemType SymbolicLink -Path "$profilePath\profile.ps1" -Target "$repoPath\profile.ps1"

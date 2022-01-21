$binPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$repoPath = Split-Path $binPath -Parent

$scoopPersist = "$env:USERPROFILE\scoop\persist"
$repoPersist = "$repoPath\persist"

Copy-Item $repoPersist -Destination $scoopPersist -Force -Recurse

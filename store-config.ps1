$repoPath = Split-Path $MyInvocation.MyCommand.Path -Parent

$scoopPersist = "$env:USERPROFILE\scoop\persist"
$repoPersist = "$repoPath\persist"

Copy-Item $scoopPersist -Destination $repoPersist -Force -Recurse


Powershell.exe -executionpolicy Unrestricted -File  ".\main-script.ps1"
$Rez=$LASTEXITCODE


if ( $Rez -eq 0 ) {
    git bisect good
} else {
    git bisect bad
}
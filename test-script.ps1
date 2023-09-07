
Powershell.exe -executionpolicy Unrestricted -File  "C:\Path\script.ps1"
Rez=$LASTEXITCODE


if ( $LASTEXITCODE -eq 0 ) {
    git bisect good
} else {
    git bisect bad
}
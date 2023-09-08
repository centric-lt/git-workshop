$BRez=-1
$Rez=0

while ( $BRez -ne 0 ) {

    Powershell.exe -executionpolicy Unrestricted -File  ".\main-script.ps1"
    $Rez=$LASTEXITCODE

    if ( $Rez -eq 0 ) {
        Wtite-Host "********* GOOD Branch **********"
        git status | Select-String -Pattern " at " -CaseSensitive -SimpleMatch
        git bisect good | Select-String -Pattern '0 revisions left to test after this' -CaseSensitive -SimpleMatch -Quiet
        $BRez=$LASTEXITCODE

    } else {
        Wtite-Host "********** BAD Branch **********"
        git status | Select-String -Pattern " at " -CaseSensitive -SimpleMatch
        git bisect bad | Select-String -Pattern '0 revisions left to test after this' -CaseSensitive -SimpleMatch -Quiet
        $BRez=$LASTEXITCODE

    }
}

git status
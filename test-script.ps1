$BRez=$False
$Rez=$True

while ( $BRez -ne $True ) {

    $out = & Powershell.exe -executionpolicy Unrestricted -File  ".\main-script.ps1"
    $Rez = $out | Select-String -Pattern ': ObjectNotFound:' -CaseSensitive -SimpleMatch -Quiet
    # PowerShell has a weird execution result setting and $? $LASTEXITCODE does not help to catch failure :)

    if ( $Rez -ne $True ) {
        Write-Host "********* GOOD Branch **********"
        git status | Select-String -Pattern " at " -CaseSensitive -SimpleMatch
        $BRez=git bisect good | Select-String -Pattern 'is the first bad commit' -CaseSensitive -SimpleMatch -Quiet
    } else {
        Write-Host "********** BAD Branch **********"
        git status | Select-String -Pattern " at " -CaseSensitive -SimpleMatch
        $BRez=git bisect bad | Select-String -Pattern 'is the first bad commit' -CaseSensitive -SimpleMatch -Quiet
    }
}

git bisect view

Function Get-PCUpTime {
    param (
        [string[]]$ComputerName = 'localhost'
    )
    try {
        foreach ($computer in $computerName) {
            If ($computer -eq "localhost") {
            }
            Else { Invoke-command -ComputerName $computer -ScriptBlock 
          ➥ { Get-Uptime } -ErrorAction Stop}
        }
    }
    catch {
        Write-Error "Cannot connect To $computer"
    }
}



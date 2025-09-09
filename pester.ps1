$ErrorActionPreference = "Stop"
function Version {
    (Get-Module Pester).Version
}
function Log {
    Write-Host $args
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}

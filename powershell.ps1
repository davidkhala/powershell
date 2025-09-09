$ErrorActionPreference = "Stop"
function Get-WebFile {
    # Download file from Uri to local Path
    param (
        [string]$Uri,
        [string]$Path
    )

    
    if (!$Path) { 
        $Path = (Split-Path $Uri -Leaf)
    }
    
    Invoke-WebRequest -Uri $Uri -OutFile $Path -UseBasicParsing
}
function Find {
    param (
        [string]$Cmd
    )
    Get-Command $Cmd
}

function Use-RemoteScript {
    # source远程脚本，可用于加载远程PowerShell脚本中的所有函数到当前Powershell环境中，以直接调用
    param (
        [string]$Uri
    )
    (Invoke-WebRequest -Uri $Uri -UseBasicParsing).Content | Invoke-Expression
}
function Version {
    # Get current Powershell version 
    $PSVersionTable.PSVersion
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}

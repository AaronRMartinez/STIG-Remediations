<#
.SYNOPSIS
    This PowerShell script ensures that automatically signing in the last interactive user after a system-initiated restart is disabled.
    
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-12
    Last Modified   : 2025-03-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000325

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000325.ps1
#>

# Define registry path and value
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$ValueName = "DisableAutomaticRestartSignOn"
$ValueData = 1  # Disable automatic restart sign-on

# Ensure the registry path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -Type DWord

Write-Output "Successfully set '$ValueName' to '$ValueData' at $RegPath"

# Force policy update
gpupdate /force

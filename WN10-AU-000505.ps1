<#
.SYNOPSIS
    This PowerShell script ensures that the Security event log size is at least configured to be 1024000 KB or greater.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-08
    Last Modified   : 2025-03-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000505.ps1 
#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the MaxSize DWORD value to 0xFA000 (1,024,000 in decimal)
Set-ItemProperty -Path $RegPath -Name "MaxSize" -Value 0xFA000 -Type DWord

# Confirm the change
Write-Output "Registry setting applied: $RegPath\MaxSize = 0xFA000"

<#
.SYNOPSIS
    This PowerShell script ensures that the System event log size is configured to be 32768 KB or greater.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-08
    Last Modified   : 2025-03-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000510

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000510.ps1 
#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the MaxSize DWORD value to 0x8000 (32,768 in decimal)
Set-ItemProperty -Path $RegPath -Name "MaxSize" -Value 0x8000 -Type DWord

# Confirm the change
Write-Output "Registry setting applied: $RegPath\MaxSize = 0x8000"

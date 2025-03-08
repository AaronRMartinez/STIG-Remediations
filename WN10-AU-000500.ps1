<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-07
    Last Modified   : 2025-03-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AU-000500.ps1 
#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the MaxSize DWORD value to 0x8000 (32,768 in decimal)
Set-ItemProperty -Path $RegPath -Name "MaxSize" -Value 0x8000 -Type DWord

# Confirm the change
Write-Output "Registry setting applied: $RegPath\MaxSize = 0x8000"

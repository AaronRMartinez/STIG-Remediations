<#
.SYNOPSIS
    This PowerShell script ensures that enhanced anti-spoofing for facial recognition is be enabled on Window 10.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-10
    Last Modified   : 2025-03-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000195

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000195.ps1
#>

# Define registry path and value
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures"
$ValueName = "EnhancedAntiSpoofing"
$ValueData = 1  # Enable Enhanced Anti-Spoofing

# Check if the registry key exists, create if necessary
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $RegPath -Name $ValueName -Value $ValueData -Type DWord

Write-Output "Successfully set $ValueName to $ValueData at $RegPath"

# Force policy update
gpupdate /force

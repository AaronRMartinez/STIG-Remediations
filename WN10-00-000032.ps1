<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 systems must use a BitLocker PIN with a minimum length of six digits for pre-boot authentication.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-08
    Last Modified   : 2025-03-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000032.ps1
#>

# Define the registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Define the registry value name and required minimum PIN length
$ValueName = "MinimumPIN"
$MinPINLength = 6

# Check if the registry path exists, if not, create it
if (-Not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the MinimumPIN value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $MinPINLength -Type DWord

# Confirm the change
$CurrentValue = Get-ItemProperty -Path $RegistryPath -Name $ValueName | Select-Object -ExpandProperty $ValueName
Write-Output "BitLocker Minimum PIN has been set to: $CurrentValue"

# Force policy update (optional)
gpupdate /force

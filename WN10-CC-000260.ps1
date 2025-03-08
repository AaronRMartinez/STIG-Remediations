<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to require a minimum pin length of six characters or greater.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-08
    Last Modified   : 2025-03-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000260

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000260
#>

# Define registry path
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity"

# Define the registry value name and desired minimum PIN length (set to 6, can be increased)
$ValueName = "MinimumPINLength"
$MinPINLength = 6

# Check if the registry path exists, if not, create it
if (-Not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set the Minimum PIN Length value
Set-ItemProperty -Path $RegistryPath -Name $ValueName -Value $MinPINLength -Type DWord

# Confirm the change
$CurrentValue = Get-ItemProperty -Path $RegistryPath -Name $ValueName | Select-Object -ExpandProperty $ValueName
Write-Output "Minimum PIN Length has been set to: $CurrentValue"

# Force policy update (optional)
gpupdate /force

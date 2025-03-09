<#
.SYNOPSIS
    This PowerShell script ensures that the Windows PowerShell 2.0 feature is disabled on the system.

.NOTES
    Author          : Aaron Martinez
    LinkedIn        : linkedin.com/in/aaron-m-59725a332/
    GitHub          : github.com/AaronRMartinez
    Date Created    : 2025-03-08
    Last Modified   : 2025-03-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000155
#>

# Check if PowerShell v2 is enabled
$PowerShellV2 = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -like "*PowerShellv2*" -and $_.State -eq "Enabled" }

if ($PowerShellV2) {
    Write-Output "PowerShell v2 is enabled. Disabling it now..."

    # Disable PowerShell v2 and PowerShell v2 Root
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2 -NoRestart -WarningAction SilentlyContinue
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -NoRestart -WarningAction SilentlyContinue

    Write-Output "PowerShell v2 has been disabled. A system restart is recommended."
} else {
    Write-Output "PowerShell v2 is already disabled. No action needed."
}

# Force policy update
gpupdate /force

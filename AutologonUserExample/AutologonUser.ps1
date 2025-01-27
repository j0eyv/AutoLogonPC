# Define the parameters for the user which will be used to log in (change these)
$username = "User@domain.com"
$domain = "azuread"
$password = "SETPASSWORDHERE"

# Define the system parameters (no need to change these)
$destinationFolder = "C:\ProgramData\SysInternals\Autologon"
$destinationPath = "$destinationFolder\Autologon64.exe"
$winlogonPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Accept EULA
try {
    $regPath = "HKCU:\Software\Sysinternals\Autologon"
    $regName = "EulaAccepted"
    $regValue = 1

    # Create registry key and set the DWORD value
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord -Force
} catch {
    # Silently ignore errors
}


# Execute autologon
cd "C:\ProgramData\SysInternals\Autologon\"
.\Autologon64.exe $username $domain $password

# Delay before intune will reboot the device
start-sleep 120
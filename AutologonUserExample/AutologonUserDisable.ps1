# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Remove the specified registry keys
Remove-ItemProperty -Path $registryPath -Name "DefaultDomainName" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path $registryPath -Name "DefaultUserName" -ErrorAction SilentlyContinue

# Set AutoAdminLogon to 0
Set-ItemProperty -Path $registryPath -Name "AutoAdminLogon" -Value "0"
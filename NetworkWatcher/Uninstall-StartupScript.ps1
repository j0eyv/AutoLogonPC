# Remove the local GPO script data
Remove-Item -Path "$($env:ProgramData)\Scripts\Startup\" -Recurse -Confirm:$False -Force -Erroraction SilentlyContinue
 
# Remove the local GPO 
Remove-Item -Path "$($env:systemroot)\System32\GroupPolicy\Machine\Scripts\Startup" -Recurse -Confirm:$False -Force -Erroraction SilentlyContinue
 
# Remove the Startup GPO Key
$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Startup\"
 
# Check if the registry key exists before removing it
if (Test-Path -Path $registryPath) {
    # Remove the registry key
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Registry key removed successfully."
} else {
    Write-Host "Registry key not found."
}
 
# Remove the Startup GPO State Key
$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Group Policy\State\Machine\Scripts\Startup"
 
# Check if the registry key exists before removing it
if (Test-Path -Path $registryPath) {
    # Remove the registry key
    Remove-Item -Path $registryPath -Recurse
    Write-Host "Registry key removed successfully."
} else {
    Write-Host "Registry key not found."
}
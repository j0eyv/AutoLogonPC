# Create required folders
if (-not (Test-Path "$($env:systemroot)\system32\GroupPolicy\User"))
{
    Mkdir "$($env:systemroot)\system32\GroupPolicy\User"
}
 
if (-not (Test-Path "$($env:systemroot)\system32\GroupPolicy\Machine\Scripts\Startup\0\0"))
{
    Mkdir "$($env:systemroot)\system32\GroupPolicy\Machine\Scripts\Startup\0\0"
}
 
if (-not (Test-Path "$($env:systemroot)\system32\GroupPolicy\Machine\Scripts\Shutdown"))
{
    Mkdir "$($env:systemroot)\system32\GroupPolicy\Machine\Scripts\Shutdown"
}
 
if (-not (Test-Path "$($env:ProgramData)\Scripts\Startup\GPO"))
{
    Mkdir "$($env:ProgramData)\Scripts\Startup\GPO"
}
 
# Copy required files to the local device
Copy-item -path "$psscriptroot\NetworkWatcher.bat" -Destination "$($env:ProgramData)\Scripts\Startup" -Confirm:$false -Force
Copy-item -path "$psscriptroot\StartupState.reg" -Destination "$($env:ProgramData)\Scripts\Startup" -Confirm:$false -Force
Copy-item -path "$psscriptroot\Startup.reg" -Destination "$($env:ProgramData)\Scripts\Startup" -Confirm:$false -Force
Copy-item -path "$psscriptroot\GPO\gpt.ini" -Destination "$($env:ProgramData)\Scripts\Startup\GPO" -Confirm:$false -Force
Copy-item -path "$psscriptroot\GPO\Machine\Scripts\scripts.ini" -Destination "$($env:ProgramData)\Scripts\Startup\GPO" -Confirm:$false -Force
 
# Define the path to your .reg file
$regFile1 = "C:\Programdata\Scripts\Startup\Startup.reg"
$regFile2 = "C:\Programdata\Scripts\Startup\StartupState.reg"
 
# Use reg.exe to import the .reg file
Start-Process -FilePath "reg.exe" -ArgumentList "import $regFile1"
Start-Process -FilePath "reg.exe" -ArgumentList "import $regFile2"
 
# Copy required GPO files
Copy-item -path "$psscriptroot\GPO\gpt.ini" -Destination "$($env:SystemRoot)\System32\GroupPolicy" -Confirm:$false -Force
Copy-item -path "$psscriptroot\GPO\Machine\Scripts\scripts.ini" -Destination "$($env:SystemRoot)\System32\GroupPolicy\Machine\Scripts" -Confirm:$false -Force
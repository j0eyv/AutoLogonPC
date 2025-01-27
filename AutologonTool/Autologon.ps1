# Define the URL and destination path
$url = "https://live.sysinternals.com/Autologon64.exe"
$destinationFolder = "C:\ProgramData\SysInternals\Autologon"
$destinationPath = "$destinationFolder\Autologon64.exe"

# Create the destination folder if it does not exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder -Force
}

# Download the file
Invoke-WebRequest -Uri $url -OutFile $destinationPath
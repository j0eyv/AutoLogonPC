# Define the source file and folder
$destinationFolder = "C:\ProgramData\SysInternals\Autologon"
$destinationPath = "$destinationFolder\Autologon64.exe"


# Remove the downloaded file if it exists
if (Test-Path -Path $destinationPath) {
    Remove-Item -Path $destinationPath -Force
}

# Optionally, remove the folder if it is empty
if ((Test-Path -Path $destinationFolder) -and (Get-ChildItem -Path $destinationFolder | Measure-Object).Count -eq 0) {
    Remove-Item -Path $destinationFolder -Force
}
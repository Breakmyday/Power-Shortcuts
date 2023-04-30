# Create sleep.bat file with sleep command
$scriptContent = '%windir%\System32\rundll32.exe powrprof.dll,SetSuspendState 0,1,0'
$scriptPath = "$env:USERPROFILE\Desktop\sleep.bat"
Set-Content -Path $scriptPath -Value $scriptContent

# Create sleep.lnk shortcut file
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\sleep.lnk")
$Shortcut.TargetPath = $scriptPath
$Shortcut.Save()

# Move sleep.lnk to the Windows folder
$destination = Join-Path -Path $env:windir -ChildPath 'sleep.lnk'
Move-Item -Path "$env:USERPROFILE\Desktop\sleep.lnk" -Destination $destination -Force
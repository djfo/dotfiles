# Run this script in Windows PowerShell (Admin) after manually enabling script execution:
#
# > Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
#
# An instance of Windows PowerShell with Admin permissions can be started using the keyboard shortcut <Win>-X, A .

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet
Install-Package PSReadLine -Force
Install-Package z -Force -AllowClobber

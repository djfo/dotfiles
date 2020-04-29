# Run in Windows PowerShell (Admin), i.e. <Win>-X, A
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet
Install-Package PSReadLine -Force
Install-Package z -Force -AllowClobber

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if ($host.Name -eq 'ConsoleHost') {
  $env:Path += ";${env:ProgramFiles(x86)}\Vim\vim81"
  $env:Path += ";${env:ProgramFiles}\7-Zip"
  $env:Path += ";${env:USERPROFILE}\AppData\Local\Programs\Python\Python38"

  Import-Module PSReadLine
  Set-PSReadLineOption -EditMode Emacs
}

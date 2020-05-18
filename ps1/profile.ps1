[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

if ($host.Name -eq 'ConsoleHost') {
  $env:Path += ";${env:ProgramFiles(x86)}\Vim\vim81"

  Import-Module PSReadLine
  Set-PSReadLineOption -EditMode Emacs
}

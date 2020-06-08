function Prompt {
  $path = $pwd.Path
  if ($path -eq $env:USERPROFILE) {
    Write-Host "~" -NoNewline
  }
  elseif ($path.Length -gt (Get-Host).UI.RawUI.BufferSize.Width/2) {
    Write-Host $(Split-Path -Path $pwd -Qualifier) -NoNewline -ForegroundColor Cyan
    Write-Host "\..\" -NoNewline
    Write-Host $(Split-Path -Path $pwd -Leaf) -NoNewline -ForegroundColor Cyan
  }
  else {
    Write-Host $path -NoNewline -ForegroundColor Cyan
  }

  if ($?) {
    Write-Host '>' -NoNewline -ForegroundColor White
  }
  else {
    Write-Host '>' -NoNewline -ForegroundColor Red
  }

  return " "
}

function Up($Arg) {
  if ($Arg -eq $null) {
    Set-Location ..
  }
  elseif ($Arg.GetType().Name -eq "Int32") {
    for ($i = 0; $i -lt $Arg; $i++) {
      Set-Location ..
    }
  }
  elseif ($Arg.GetType().Name -eq "String") {
    $oldpwd = $pwd
    While (!(Test-Path $Arg)) {
      Set-Location ..
      if ($pwd.Path -eq $oldpwd.Path) {
        Write-Host "cannot go up"
        return
      }
    }
  }
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

$env:Path += ";${env:ProgramFiles(x86)}\Vim\vim82"
$env:Path += ";${env:ProgramFiles}\7-Zip"
$env:Path += ";${env:ProgramFiles}\Git\bin"
$env:Path += ";${env:USERPROFILE}\AppData\Local\Programs\Python\Python38"

Set-Alias -Name g -Value git
Set-Alias -Name vi -Value vim

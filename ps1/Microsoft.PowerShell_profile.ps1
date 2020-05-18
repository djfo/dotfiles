function Prompt {
  $path = $pwd.Path
  if ($path.Length -gt (Get-Host).UI.RawUI.BufferSize.Width/2) {
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
    cd ..
  }
  elseif ($Arg.GetType().Name -eq "Int32") {
    for ($i = 0; $i -lt $Arg; $i++) {
      cd ..
    }
  }
  elseif ($Arg.GetType().Name -eq "String") {
    $oldpwd = $pwd
    While (!(Test-Path $Arg)) {
      cd ..
      if ($pwd.Path -eq $oldpwd.Path) {
        Write-Host "cannot go up"
        return
      }
    }
  }
}

Set-Alias -Name g -Value git
Set-Alias -Name vi -Value vim

function Prompt {
  $parent = Split-Path -Path $pwd -Parent
  if ($parent -ne "") {
    Write-Host $(Split-Path -Path $pwd -Parent) -NoNewline -ForegroundColor Cyan
    Write-Host '\' -NoNewline
  }
  Write-Host $(Split-Path -Path $pwd -Leaf) -NoNewline -ForegroundColor Cyan

  Write-Host " " -NoNewLine

  if ($?) {
    Write-Host '>' -NoNewline -ForegroundColor White
  }
  else {
    Write-Host '>' -NoNewline -ForegroundColor Red
  }

  return " "
}

Set-Alias -Name g -Value git
Set-Alias -Name vi -Value vim

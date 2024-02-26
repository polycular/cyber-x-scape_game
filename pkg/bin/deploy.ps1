# set -e but only for pwsh commands
$ErrorActionPreference = "Stop"

ssh cxs_app_server @'
  /home/main/app/cxs/source/pkg/bin/release.sh
'@
if (-not $?) { Write-Error 'Deploy failed!' -ErrorAction Stop }

Read-Host -Prompt "Deploy done. Enter to exit. |ò.ó| Huhuuu"

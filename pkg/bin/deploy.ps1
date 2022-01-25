# set -e but only for pwsh commands
$ErrorActionPreference = "Stop"

# mix test
# if ($LASTEXITCODE -ne 0) { Write-Error 'Test failed!' -ErrorAction Stop }

sh ./pkg/bin/sync_source.sh
if (-not $?) { Write-Error 'Sync failed!' -ErrorAction Stop }
Write-Host "Sync done." -ForegroundColor Green

ssh cxs_app_server @'
  /home/main/app/cxs/source/pkg/bin/release.sh
'@
if (-not $?) { Write-Error 'Deploy failed!' -ErrorAction Stop }

Read-Host -Prompt "Deploy done. Enter to exit. |ò.ó| Huhuuu"

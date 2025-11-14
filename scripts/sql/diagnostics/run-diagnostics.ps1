param(
  [string]$SqlPlus="sqlplus",
  [string]$DateTag="$(Get-Date -Format yyyyMMdd_HHmmss)"
)
#cd "..\sql\diagnostics"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$diag = Join-Path $here "run_all_diagnostics.sql"
& $SqlPlus "/ as sysdba" "@$diag" "$DateTag"
#echo $SqlPlus "/ as sysdba" "@$diag" "_dte=$DateTag"
Write-Host "Diagnostics complete. See diag_report_$DateTag.log in current directory."


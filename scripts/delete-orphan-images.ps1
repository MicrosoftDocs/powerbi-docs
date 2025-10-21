<#
.SYNOPSIS
Delete orphaned images listed in orphan-images-current.txt (no backup).
.DESCRIPTION
Reads a list file containing relative paths (from DocRoot) to orphaned image files and deletes them.
Optionally prunes now-empty directories.
.PARAMETER DocRoot
Root folder containing documentation and media (absolute or relative).
.PARAMETER ListFile
File containing orphan image relative paths (one per line).
.PARAMETER PruneEmptyDirs
Switch to remove directories left empty after deletions (skips DocRoot itself).
.EXAMPLE
./scripts/delete-orphan-images.ps1 -DocRoot powerbi-docs -ListFile orphan-images-current.txt -PruneEmptyDirs
#>
param(
  [string]$DocRoot = 'powerbi-docs',
  [string]$ListFile = 'orphan-images-current.txt',
  [switch]$PruneEmptyDirs
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $DocRoot)) { throw "DocRoot '$DocRoot' not found" }
if (-not (Test-Path $ListFile)) { throw "List file '$ListFile' not found" }

$docRootFull = (Get-Item $DocRoot).FullName
$paths = Get-Content $ListFile | Where-Object { $_ -and -not $_.StartsWith('#') } | ForEach-Object { $_.Trim() }
Write-Host "Orphan image entries: $($paths.Count)" -ForegroundColor Cyan

$deleted = 0
$missing = 0
foreach ($rel in $paths) {
  $full = Join-Path $docRootFull $rel
  if (Test-Path $full) {
    try {
      Remove-Item -LiteralPath $full -Force
      $deleted++
    } catch {
      Write-Warning "Failed to delete $rel : $_"
    }
  } else {
    $missing++
  }
}
Write-Host "Deleted images: $deleted" -ForegroundColor Green
Write-Host "Missing (already absent): $missing" -ForegroundColor DarkYellow

if ($PruneEmptyDirs) {
  Write-Host "Pruning empty directories..." -ForegroundColor Cyan
  $dirs = Get-ChildItem -Path $docRootFull -Recurse -Directory | Sort-Object FullName -Descending
  $pruned = 0
  foreach ($d in $dirs) {
    if (-not (Get-ChildItem -LiteralPath $d.FullName -Force | Where-Object { $_.Name -notin '.gitkeep' })) {
      try { Remove-Item -LiteralPath $d.FullName -Force; $pruned++ } catch { Write-Warning "Failed to prune $($d.FullName): $_" }
    }
  }
  Write-Host "Pruned empty directories: $pruned" -ForegroundColor Green
}

Write-Output "DELETED_IMAGE_COUNT=$deleted"

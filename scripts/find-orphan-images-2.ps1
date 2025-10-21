<#
Duplicate of find-orphan-images.ps1 for execution due to file lock issues.
#>
param(
	[string]$DocRoot = "powerbi-docs",
	[string]$OutputFile = "orphan-images-current.txt"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $DocRoot)) { Write-Error "DocRoot '$DocRoot' not found." }

$docRootItem = Get-Item $DocRoot
$docRootFull = $docRootItem.FullName
$imageExtensions = ".png", ".jpg", ".jpeg", ".gif", ".svg"

Write-Host "Enumerating image files under $docRootFull ..." -ForegroundColor Cyan
$imageFiles = Get-ChildItem -Path $docRootFull -Recurse -File | Where-Object { $imageExtensions -contains $_.Extension.ToLower() }
Write-Host "Total image files found: $($imageFiles.Count)" -ForegroundColor Cyan

Write-Host "Enumerating markdown/yaml reference files ..." -ForegroundColor Cyan
$referenceFiles = Get-ChildItem -Path $docRootFull -Recurse -File -Include *.md, *.yml
Write-Host "Total content files (md/yml) scanned: $($referenceFiles.Count)" -ForegroundColor Cyan

$orphanImages = New-Object System.Collections.Generic.List[string]
Write-Host "Resolving references by parsing file link tokens (accurate path resolution) ..." -ForegroundColor Cyan

$imagePathSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($img in $imageFiles) { $imagePathSet.Add($img.FullName) | Out-Null }
$referencedImagePaths = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

$markdownParenPattern = '\(([^)]+\.(?:png|jpg|jpeg|gif|svg))\)'
$htmlImgPatternDouble = '<img[^>]+src="([^">]+\.(?:png|jpg|jpeg|gif|svg))"'
$htmlImgPatternSingle = "<img[^>]+src='([^'>]+\.(?:png|jpg|jpeg|gif|svg))'"
$directiveSourcePatternDouble = 'source="([^">]+\.(?:png|jpg|jpeg|gif|svg))"'
$directiveSourcePatternSingle = "source='([^'>]+\.(?:png|jpg|jpeg|gif|svg))'"

$fileCounter = 0
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
foreach ($file in $referenceFiles) {
	$fileCounter++
	try { $content = [System.IO.File]::ReadAllText($file.FullName) } catch { continue }
	$candidates = New-Object System.Collections.Generic.List[string]
	foreach ($m in [Regex]::Matches($content, $markdownParenPattern, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
	foreach ($m in [Regex]::Matches($content, $htmlImgPatternDouble, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
	foreach ($m in [Regex]::Matches($content, $htmlImgPatternSingle, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
	foreach ($m in [Regex]::Matches($content, $directiveSourcePatternDouble, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
	foreach ($m in [Regex]::Matches($content, $directiveSourcePatternSingle, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
	if ($candidates.Count -eq 0) { continue }
	$baseDir = $file.DirectoryName
	foreach ($raw in $candidates) {
		$candidate = $raw.Trim()
		if ($candidate -match '^(https?:|data:)') { continue }
		if ($candidate.Contains('#')) { $candidate = $candidate.Split('#')[0] }
		if ($candidate.Contains('?')) { $candidate = $candidate.Split('?')[0] }
		$candidate = $candidate -replace '/', '\'
		try { $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($baseDir, $candidate)) } catch { continue }
		if ($imagePathSet.Contains($resolved)) { $referencedImagePaths.Add($resolved) | Out-Null }
	}
	if ($fileCounter % 250 -eq 0) { Write-Host "Parsed $fileCounter / $($referenceFiles.Count) files... Referenced: $($referencedImagePaths.Count)" -ForegroundColor DarkGray }
}
$stopwatch.Stop()
foreach ($img in $imageFiles) { if (-not $referencedImagePaths.Contains($img.FullName)) { $orphanImages.Add($img.FullName.Substring($docRootFull.Length + 1).Replace('\\','/')) } }
Write-Host "Scan complete in $([Math]::Round($stopwatch.Elapsed.TotalSeconds,2))s" -ForegroundColor Green
Write-Host "Referenced images: $($referencedImagePaths.Count)" -ForegroundColor Green
Write-Host "Orphan images: $($orphanImages.Count)" -ForegroundColor Yellow
try { $OutputFileFull = [System.IO.Path]::Combine((Get-Location).Path, $OutputFile); $orphanImages | Sort-Object | Set-Content -Path $OutputFileFull -Encoding UTF8; Write-Host "Orphan list written to: $OutputFileFull" -ForegroundColor Yellow } catch { Write-Error "Failed to write orphan list: $_" }
Write-Output "ORPHAN_IMAGE_COUNT=$($orphanImages.Count)"

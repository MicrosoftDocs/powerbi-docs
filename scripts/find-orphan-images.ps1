<#
.SYNOPSIS
Accurately identify orphaned image assets under a Power BI docs root.

.DESCRIPTION
Enumerates all image files (.png/.jpg/.jpeg/.gif/.svg) beneath the specified DocRoot (default: powerbi-docs).
Scans every .md and .yml file under the repository for case-insensitive references to each image's full relative path
(from DocRoot). A reference is considered a hit if the exact relative path string appears anywhere in the file content.
Supports both Markdown image syntax and generic inline references (including HTML <img src="...">) because we match
raw path substrings rather than rendering constructs.

Outputs a UTF-8 text file with one orphan image path per line (relative to DocRoot). Also prints summary counts.

.NOTES
- Uses full relative path matching to avoid false positives from identical basenames in different folders.
- Case-insensitive search via Select-String.
- Optimized: builds a single list of reference files and performs one Select-String per image (simpler & reliable).
  For very large repositories this is O(N*M); can be refactored later to extract all image-like tokens first.
- No deletions are performed; this script is read-only.

.PARAMETER DocRoot
Absolute or relative path to the documentation root (contains media and article folders). Defaults to 'powerbi-docs'.

.PARAMETER OutputFile
Path to write orphan list. Defaults to './orphan-images-current.txt' (relative to current directory).

.EXAMPLE
PS> ./scripts/find-orphan-images.ps1 -DocRoot powerbi-docs -OutputFile orphan-images-current.txt
#>
param(
    [string]$DocRoot = "powerbi-docs",
    [string]$OutputFile = "orphan-images-current.txt"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path $DocRoot)) {
    Write-Error "DocRoot '$DocRoot' not found."
}

# Resolve full paths
$docRootItem = Get-Item $DocRoot
$docRootFull = $docRootItem.FullName

# Image extensions to include
$imageExtensions = ".png", ".jpg", ".jpeg", ".gif", ".svg"

Write-Host "Enumerating image files under $docRootFull ..." -ForegroundColor Cyan
$imageFiles = Get-ChildItem -Path $docRootFull -Recurse -File | Where-Object { $imageExtensions -contains $_.Extension.ToLower() }

Write-Host "Total image files found: $($imageFiles.Count)" -ForegroundColor Cyan

Write-Host "Enumerating markdown/yaml reference files ..." -ForegroundColor Cyan
$referenceFiles = Get-ChildItem -Path $docRootFull -Recurse -File -Include *.md, *.yml
Write-Host "Total content files (md/yml) scanned: $($referenceFiles.Count)" -ForegroundColor Cyan

# Prepare orphan list collection
$orphanImages = New-Object System.Collections.Generic.List[string]

Write-Host "Resolving references by parsing file link tokens (accurate path resolution) ..." -ForegroundColor Cyan

# Build hash set of all image full paths for O(1) membership tests
$imagePathSet = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($img in $imageFiles) { $imagePathSet.Add($img.FullName) | Out-Null }

$referencedImagePaths = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

# Regex patterns to capture candidate image paths
$markdownParenPattern = '\(([^)]+\.(?:png|jpg|jpeg|gif|svg))\)'
$htmlImgPatternDouble = '<img[^>]+src="([^">]+\.(?:png|jpg|jpeg|gif|svg))"'
$htmlImgPatternSingle = "<img[^>]+src='([^'>]+\.(?:png|jpg|jpeg|gif|svg))'"
$directiveSourcePatternDouble = 'source="([^">]+\.(?:png|jpg|jpeg|gif|svg))"'
$directiveSourcePatternSingle = "source='([^'>]+\.(?:png|jpg|jpeg|gif|svg))'"

$fileCounter = 0
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
foreach ($file in $referenceFiles) {
    $fileCounter++
    try {
        $content = [System.IO.File]::ReadAllText($file.FullName)
    } catch {
        Write-Warning "Failed to read $($file.FullName): $_"
        continue
    }

    $candidates = New-Object System.Collections.Generic.List[string]

    foreach ($m in [Regex]::Matches($content, $markdownParenPattern, 'IgnoreCase')) {
        $candidates.Add($m.Groups[1].Value) | Out-Null
    }
    foreach ($m in [Regex]::Matches($content, $htmlImgPatternDouble, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
    foreach ($m in [Regex]::Matches($content, $htmlImgPatternSingle, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
    foreach ($m in [Regex]::Matches($content, $directiveSourcePatternDouble, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }
    foreach ($m in [Regex]::Matches($content, $directiveSourcePatternSingle, 'IgnoreCase')) { $candidates.Add($m.Groups[1].Value) | Out-Null }

    if ($candidates.Count -eq 0) { continue }

    $baseDir = $file.DirectoryName
    foreach ($raw in $candidates) {
        $candidate = $raw.Trim()
        if ($candidate -match '^(https?:|data:)') { continue } # skip external or data URIs
        # Strip query or anchor
        if ($candidate.Contains('#')) { $candidate = $candidate.Split('#')[0] }
        if ($candidate.Contains('?')) { $candidate = $candidate.Split('?')[0] }
        # Normalize slashes
        $candidate = $candidate -replace '/', '\'
        # Resolve relative path
        try {
            $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($baseDir, $candidate))
        } catch {
            continue
        }
        if ($imagePathSet.Contains($resolved)) {
            $referencedImagePaths.Add($resolved) | Out-Null
        }
    }

    if ($fileCounter % 250 -eq 0) {
        Write-Host "Parsed $fileCounter / $($referenceFiles.Count) content files... Referenced images so far: $($referencedImagePaths.Count)" -ForegroundColor DarkGray
    }
}
$stopwatch.Stop()

# Determine orphans
foreach ($img in $imageFiles) {
    if (-not $referencedImagePaths.Contains($img.FullName)) {
        $orphanImages.Add($img.FullName.Substring($docRootFull.Length + 1).Replace('\\','/'))
    }
}

Write-Host "Scan complete in $([Math]::Round($stopwatch.Elapsed.TotalSeconds,2))s" -ForegroundColor Green
Write-Host "Referenced images: $($referencedImagePaths.Count)" -ForegroundColor Green
Write-Host "Orphan images: $($orphanImages.Count)" -ForegroundColor Yellow

# Write output file (relative paths one per line)
# Use Join-Path rather than Resolve-Path (which requires pre-existing path) to avoid failure when creating new file.
try {
    $OutputFileFull = [System.IO.Path]::Combine((Get-Location).Path, $OutputFile)
    $orphanImages | Sort-Object | Set-Content -Path $OutputFileFull -Encoding UTF8
    Write-Host "Orphan list written to: $OutputFileFull" -ForegroundColor Yellow
} catch {
    Write-Error "Failed to write orphan list to '$OutputFile': $_"
}

# Emit a machine-readable summary line for automation
Write-Output "ORPHAN_IMAGE_COUNT=$($orphanImages.Count)"

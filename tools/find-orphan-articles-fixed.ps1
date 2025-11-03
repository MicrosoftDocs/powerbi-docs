# PowerShell script to find orphaned articles and YML files in Power BI documentation
# Usage: .\find-orphan-articles-fixed.ps1 -DocsPath "c:\repos\powerbi-docs-pr\powerbi-docs"

param(
    [Parameter(Mandatory=$true)]
    [string]$DocsPath,
    
    [Parameter(Mandatory=$false)]
    [string]$OutputFile = "orphan-articles-report.txt"
)

# Validate path exists
if (-not (Test-Path $DocsPath)) {
    Write-Error "Path does not exist: $DocsPath"
    exit 1
}

Write-Host "Scanning documentation at: $DocsPath" -ForegroundColor Cyan
Write-Host "This may take a few minutes..." -ForegroundColor Yellow

# Find all toc.yml files (case-insensitive)
Write-Host "`nFinding all toc.yml files..." -ForegroundColor Cyan
$tocFiles = Get-ChildItem -Path $DocsPath -Recurse -File | Where-Object { $_.Name -ieq "toc.yml" }
Write-Host "Found $($tocFiles.Count) toc.yml files" -ForegroundColor Green

# Read all toc.yml content into memory for faster searching
Write-Host "`nReading toc.yml content..." -ForegroundColor Cyan
$allTocContent = ""
foreach ($tocFile in $tocFiles) {
    $allTocContent += Get-Content $tocFile.FullName -Raw
    $allTocContent += "`n"
}
Write-Host "Loaded toc content from $($tocFiles.Count) files" -ForegroundColor Green

# Find all markdown files (excluding certain patterns)
Write-Host "`nFinding all markdown files..." -ForegroundColor Cyan
$allMarkdownFiles = Get-ChildItem -Path $DocsPath -Recurse -Filter "*.md" -File
Write-Host "Found $($allMarkdownFiles.Count) total markdown files" -ForegroundColor Gray

# Exclude common patterns that shouldn't be in TOCs
$markdownFiles = $allMarkdownFiles | Where-Object {
    $_.Name -notmatch "^(README|CONTRIBUTING|LICENSE|PULL_REQUEST_TEMPLATE|ISSUE_TEMPLATE)" -and
    $_.FullName -notmatch "\\\.github\\" -and
    $_.FullName -notmatch "\\templates?\\" -and
    $_.FullName -notmatch "\\\.vscode\\" -and
    $_.FullName -notmatch "\\includes\\"
}
Write-Host "Found $($markdownFiles.Count) article files to check (after excluding READMEs, templates, includes, etc.)" -ForegroundColor Green

# Find all YML files (excluding index.yml and toc.yml)
Write-Host "`nFinding YML files (excluding index.yml and toc.yml)..." -ForegroundColor Cyan
$ymlFiles = Get-ChildItem -Path $DocsPath -Recurse -Filter "*.yml" -File | Where-Object {
    $_.Name -ne "index.yml" -and 
    $_.Name -ne "toc.yml" -and
    $_.Name -ne "docfx.yml" -and
    $_.FullName -notmatch "\\\.github\\" -and
    $_.FullName -notmatch "\\templates?\\"
}
Write-Host "Found $($ymlFiles.Count) YML files to check" -ForegroundColor Green

# Function to check if a file is referenced in TOC
function Test-FileReferencedInToc {
    param(
        [string]$FilePath,
        [string]$TocContent,
        [string]$DocsRoot
    )
    
    # Get relative path from docs root
    $relativePath = $FilePath.Substring($DocsRoot.Length).TrimStart('\', '/')
    $relativePath = $relativePath -replace '\\', '/'
    
    $fullFileName = [System.IO.Path]::GetFileName($FilePath)
    
    # Escape special regex characters in the filename
    $escapedFileName = [regex]::Escape($fullFileName)
    
    # Check for exact filename match in href pattern
    # Pattern must have: href: followed by optional path, then exact filename
    # Filename must be preceded by '/' or whitespace or be at start, and followed by whitespace/end of line
    # This prevents matching "desktop-performance-analyzer.md" when looking for "performance-analyzer.md"
    if ($TocContent -match "href:\s+(?:[^\s]*/)?$escapedFileName(?:\s|`$)") {
        return $true
    }
    
    return $false
}

# Check markdown files
Write-Host "`nAnalyzing markdown file references..." -ForegroundColor Cyan
$orphanedMarkdown = @()
$referencedMarkdown = @()
$progress = 0

foreach ($mdFile in $markdownFiles) {
    $progress++
    if ($progress % 100 -eq 0) {
        Write-Host "  Processed $progress / $($markdownFiles.Count) markdown files..." -ForegroundColor Gray
    }
    
    $isReferenced = Test-FileReferencedInToc -FilePath $mdFile.FullName -TocContent $allTocContent -DocsRoot $DocsPath
    
    if ($isReferenced) {
        $referencedMarkdown += $mdFile
    } else {
        $orphanedMarkdown += $mdFile
    }
}

# Check YML files
Write-Host "`nAnalyzing YML file references..." -ForegroundColor Cyan
$orphanedYml = @()
$referencedYml = @()
$progress = 0

foreach ($ymlFile in $ymlFiles) {
    $progress++
    if ($progress % 50 -eq 0) {
        Write-Host "  Processed $progress / $($ymlFiles.Count) YML files..." -ForegroundColor Gray
    }
    
    $isReferenced = Test-FileReferencedInToc -FilePath $ymlFile.FullName -TocContent $allTocContent -DocsRoot $DocsPath
    
    if ($isReferenced) {
        $referencedYml += $ymlFile
    } else {
        $orphanedYml += $ymlFile
    }
}

# Generate report
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "ORPHANED ARTICLES REPORT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date)" -ForegroundColor Gray

Write-Host "`nMARKDOWN FILES:" -ForegroundColor White
Write-Host "  Total markdown files: $($markdownFiles.Count)" -ForegroundColor White
Write-Host "  Referenced in TOCs: $($referencedMarkdown.Count)" -ForegroundColor Green
Write-Host "  Orphaned (not in any TOC): $($orphanedMarkdown.Count)" -ForegroundColor Yellow

Write-Host "`nYML FILES (excluding index.yml and toc.yml):" -ForegroundColor White
Write-Host "  Total YML files: $($ymlFiles.Count)" -ForegroundColor White
Write-Host "  Referenced in TOCs: $($referencedYml.Count)" -ForegroundColor Green
Write-Host "  Orphaned (not in any TOC): $($orphanedYml.Count)" -ForegroundColor Yellow

# Calculate sizes
$orphanedMdSize = ($orphanedMarkdown | Measure-Object -Property Length -Sum).Sum
$orphanedMdSizeMB = [math]::Round($orphanedMdSize / 1MB, 2)
$orphanedYmlSize = ($orphanedYml | Measure-Object -Property Length -Sum).Sum
$orphanedYmlSizeKB = [math]::Round($orphanedYmlSize / 1KB, 2)

Write-Host "`nSIZE INFORMATION:" -ForegroundColor White
Write-Host "  Orphaned markdown total size: $orphanedMdSizeMB MB" -ForegroundColor Yellow
Write-Host "  Orphaned YML total size: $orphanedYmlSizeKB KB" -ForegroundColor Yellow

# Save detailed report to file
$reportContent = @"
========================================
ORPHANED ARTICLES REPORT
========================================
Generated: $(Get-Date)
Documentation Path: $DocsPath

SUMMARY:
========================================

MARKDOWN FILES:
- Total markdown files checked: $($markdownFiles.Count)
- Referenced in TOCs: $($referencedMarkdown.Count)
- Orphaned (not in any TOC): $($orphanedMarkdown.Count)
- Total size of orphaned markdown: $orphanedMdSizeMB MB

YML FILES (excluding index.yml and toc.yml):
- Total YML files checked: $($ymlFiles.Count)
- Referenced in TOCs: $($referencedYml.Count)
- Orphaned (not in any TOC): $($orphanedYml.Count)
- Total size of orphaned YML: $orphanedYmlSizeKB KB

========================================
ORPHANED MARKDOWN FILES:
========================================

"@

foreach ($mdFile in $orphanedMarkdown | Sort-Object FullName) {
    $relativePath = $mdFile.FullName.Substring($DocsPath.Length).TrimStart('\', '/')
    $sizeKB = [math]::Round($mdFile.Length / 1KB, 2)
    $reportContent += "$relativePath (${sizeKB} KB)`n"
}

$reportContent += @"

========================================
ORPHANED YML FILES:
========================================

"@

foreach ($ymlFile in $orphanedYml | Sort-Object FullName) {
    $relativePath = $ymlFile.FullName.Substring($DocsPath.Length).TrimStart('\', '/')
    $sizeKB = [math]::Round($ymlFile.Length / 1KB, 2)
    $reportContent += "$relativePath (${sizeKB} KB)`n"
}

# Add a section with full paths for easier investigation
$reportContent += @"

========================================
FULL PATHS - ORPHANED MARKDOWN FILES:
========================================

"@

foreach ($mdFile in $orphanedMarkdown | Sort-Object FullName) {
    $reportContent += "$($mdFile.FullName)`n"
}

$reportContent += @"

========================================
FULL PATHS - ORPHANED YML FILES:
========================================

"@

foreach ($ymlFile in $orphanedYml | Sort-Object FullName) {
    $reportContent += "$($ymlFile.FullName)`n"
}

$reportPath = Join-Path (Get-Location) $OutputFile
$reportContent | Out-File -FilePath $reportPath -Encoding UTF8

Write-Host "`nDetailed report saved to: $reportPath" -ForegroundColor Green

# Show first 10 orphaned files as preview
if ($orphanedMarkdown.Count -gt 0) {
    Write-Host "`nFirst 10 orphaned markdown files:" -ForegroundColor Yellow
    $orphanedMarkdown | Select-Object -First 10 | ForEach-Object {
        $relativePath = $_.FullName.Substring($DocsPath.Length).TrimStart('\', '/')
        $sizeKB = [math]::Round($_.Length / 1KB, 2)
        Write-Host "  $relativePath (${sizeKB} KB)" -ForegroundColor Gray
    }
    
    if ($orphanedMarkdown.Count -gt 10) {
        Write-Host "  ... and $($orphanedMarkdown.Count - 10) more (see report file for full list)" -ForegroundColor Gray
    }
}

if ($orphanedYml.Count -gt 0) {
    Write-Host "`nOrphaned YML files:" -ForegroundColor Yellow
    $orphanedYml | ForEach-Object {
        $relativePath = $_.FullName.Substring($DocsPath.Length).TrimStart('\', '/')
        $sizeKB = [math]::Round($_.Length / 1KB, 2)
        Write-Host "  $relativePath (${sizeKB} KB)" -ForegroundColor Gray
    }
}

Write-Host "`nDone!" -ForegroundColor Green
Write-Host "`nNOTE: These files are not referenced in any toc.yml file." -ForegroundColor Cyan
Write-Host "Review the report to determine if they should be added to a TOC or removed." -ForegroundColor Cyan

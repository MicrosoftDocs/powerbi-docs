# Test powerbi.microsoft.com URLs for redirects with proper handling
$testUrls = @(
    "https://powerbi.microsoft.com/",
    "https://powerbi.microsoft.com/clouds/",
    "https://powerbi.microsoft.com/desktop/",
    "https://powerbi.microsoft.com/get-started/",
    "https://powerbi.microsoft.com/mobile/",
    "https://powerbi.microsoft.com/support/",
    "https://powerbi.microsoft.com/report-server/",
    "https://powerbi.microsoft.com/what-is-power-bi/",
    "https://powerbi.microsoft.com/pricing/",
    "https://powerbi.microsoft.com/blog/",
    "https://powerbi.microsoft.com/developers/"
)

$results = @()

foreach ($url in $testUrls) {
    try {
        $response = Invoke-WebRequest -Uri $url -MaximumRedirection 5 -UseBasicParsing
        $finalUrl = $response.BaseResponse.ResponseUri.AbsoluteUri
        
        # Remove locale from final URL
        $cleanUrl = $finalUrl -replace '/[a-z]{2}-[a-z]{2}/', '/'
        
        $result = [PSCustomObject]@{
            Original = $url
            Final = $finalUrl
            Clean = $cleanUrl
            Redirected = ($url -ne $finalUrl)
        }
        $results += $result
        
        if ($url -ne $finalUrl) {
            Write-Host "`n$url" -ForegroundColor Cyan
            Write-Host "  -> $finalUrl" -ForegroundColor Yellow
            Write-Host "  -> $cleanUrl" -ForegroundColor Green
        } else {
            Write-Host "`n$url" -ForegroundColor Cyan
            Write-Host "  -> No redirect" -ForegroundColor Gray
        }
    }
    catch {
        Write-Host "`n$url" -ForegroundColor Cyan
        Write-Host "  -> Error: $_" -ForegroundColor Red
    }
}

Write-Host "`n`nSummary:" -ForegroundColor Magenta
Write-Host "Redirected: $($results.Where({$_.Redirected}).Count)"
Write-Host "Not redirected: $($results.Where({-not $_.Redirected}).Count)"

# Export results
$results | Export-Csv "powerbi_redirect_results.csv" -NoTypeInformation
Write-Host "`nResults saved to: powerbi_redirect_results.csv"

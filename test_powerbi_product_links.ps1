# Test more powerbi.microsoft.com URLs including root and product pages
$testUrls = @(
    "https://powerbi.microsoft.com/",
    "https://powerbi.microsoft.com/en-us/",
    "https://powerbi.microsoft.com/what-is-power-bi/",
    "https://powerbi.microsoft.com/pricing/",
    "https://powerbi.microsoft.com/features/",
    "https://powerbi.microsoft.com/compare-power-bi/",
    "https://powerbi.microsoft.com/integrations/",
    "https://powerbi.microsoft.com/developers/"
)

foreach ($url in $testUrls) {
    try {
        Write-Host "`nTesting: $url" -ForegroundColor Cyan
        $response = Invoke-WebRequest -Uri $url -MaximumRedirection 0 -ErrorAction SilentlyContinue
        Write-Host "  No redirect (200)" -ForegroundColor Green
    }
    catch {
        if ($_.Exception.Response.StatusCode -match 'Redirect|Moved') {
            $redirectUrl = $_.Exception.Response.Headers.Location
            # Remove locale from redirect URL
            $cleanUrl = $redirectUrl -replace '/[a-z]{2}-[a-z]{2}/', '/'
            Write-Host "  Redirects to: $redirectUrl" -ForegroundColor Yellow
            Write-Host "  Clean URL: $cleanUrl" -ForegroundColor Magenta
        }
        else {
            Write-Host "  Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Red
        }
    }
}

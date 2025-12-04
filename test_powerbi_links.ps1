# Test a sample of powerbi.microsoft.com URLs to determine redirect patterns
$testUrls = @(
    "https://powerbi.microsoft.com/blog/",
    "https://powerbi.microsoft.com/clouds/",
    "https://powerbi.microsoft.com/desktop/",
    "https://powerbi.microsoft.com/get-started/",
    "https://powerbi.microsoft.com/mobile/",
    "https://powerbi.microsoft.com/support/",
    "https://powerbi.microsoft.com/report-server/"
)

foreach ($url in $testUrls) {
    try {
        Write-Host "`nTesting: $url" -ForegroundColor Cyan
        $response = Invoke-WebRequest -Uri $url -MaximumRedirection 0 -ErrorAction SilentlyContinue
        Write-Host "  No redirect (200)" -ForegroundColor Green
    }
    catch {
        if ($_.Exception.Response.StatusCode -eq 'Redirect' -or 
            $_.Exception.Response.StatusCode -eq 'MovedPermanently' -or
            $_.Exception.Response.StatusCode -eq 'Found' -or
            $_.Exception.Response.StatusCode -eq 308) {
            $redirectUrl = $_.Exception.Response.Headers.Location
            Write-Host "  Redirects to: $redirectUrl" -ForegroundColor Yellow
        }
        else {
            Write-Host "  Status: $($_.Exception.Response.StatusCode)" -ForegroundColor Red
        }
    }
}

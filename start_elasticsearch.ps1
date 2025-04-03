# path to elastic search
$ESPath = "C:\elasticsearch"

# path to elasticsearch.bat
$StartFile = Join-Path $ESPath "bin\elasticsearch.bat"

# Check if the  exists
if (-Not (Test-Path $StartFile)) {
    Write-Error "elasticsearch.bat not found: $StartFile"
    exit 1
}

# Check if working
try {
    $response = Invoke-WebRequest -Uri "http://localhost:9200" -UseBasicParsing -TimeoutSec 3
    Write-Host "Ok."
} catch {
    Write-Host "Starting elasticsearch..."
    Start-Process -FilePath $StartFile -WorkingDirectory (Split-Path $StartFile)
}

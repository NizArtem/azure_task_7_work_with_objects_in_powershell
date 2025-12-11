$vmSize = "Standard_B2pts_v2"
$Path = "./data/"
$regions = @()


foreach ($file in Get-ChildItem -Path $Path) {
    $content = Get-Content $file.FullName -Raw

    if ($content -match $vmSize) {
        $regionName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
        $regions += $regionName
    }
}

$regions | ConvertTo-Json | Set-Content "result.json"

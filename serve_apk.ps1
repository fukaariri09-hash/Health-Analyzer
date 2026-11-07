$port = 8080
$ip = "192.168.29.31"
$listener = New-Object System.Net.HttpListener
try {
    $listener.Prefixes.Add("http://${ip}:$port/")
    $listener.Start()
} catch {
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:$port/")
    $listener.Start()
}
Write-Host "Server running at http://${ip}:${port}/app-debug.apk"
Write-Host "Open http://${ip}:${port}/app-debug.apk in your phone's browser to download."
Write-Host "Press Ctrl+C to stop."
while ($listener.IsListening) {
    $context = $listener.GetContext()
    $response = $context.Response
    $response.AddHeader("Content-Disposition", "attachment; filename=HealthEnhancer.apk")
    $response.ContentType = "application/vnd.android.package-archive"
    $bytes = [System.IO.File]::ReadAllBytes("E:\MyApplication2\app\build\outputs\apk\debug\app-debug.apk")
    $response.ContentLength64 = $bytes.Length
    $response.OutputStream.Write($bytes, 0, $bytes.Length)
    $response.OutputStream.Close()
}

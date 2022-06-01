# iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/codepls/Public/main/Fix_WindowsStoreAppMissing.ps1'))


$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.55"
$session.Cookies.Add((New-Object System.Net.Cookie("_ga", "GA1.2.191647889.1648768294", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_gid", "GA1.2.201043741.1648768294", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_gat", "1", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("tmr_lvid", "dc8abefb04dc5c49f6ade00d07a9dc1e", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("tmr_lvidTS", "1648768294531", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("__gads", "ID=fa040b690f90be12-221db0d679d10062:T=1648768295:RT=1648768295:S=ALNI_MYMroIAvcnFAYFxJ4JqzHYyAVGIlQ", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ym_uid", "1648768296135493321", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ym_d", "1648768296", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("top100_id", "t1.-1.2071478093.1648768295748", "/", "store.rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("last_visit", "1648728695751::1648768295751", "/", "store.rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("adtech_uid", "632b8140-fab6-4549-89b0-1b1717477435%3Arg-adguard.net", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("user-id_1.0.5_lr_lruid", "pQ8AACg1RmIfP%2By5AevKvwA%3D", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("t1_sid_-1", "s1.735087666.1648768295748.1648768295760.1.2.2", "/", "store.rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ym_isad", "2", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("_ym_visorc", "w", "/", ".rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("tmr_detect", "0%7C1648768297275", "/", "store.rg-adguard.net")))
$session.Cookies.Add((New-Object System.Net.Cookie("tmr_reqNum", "4", "/", ".rg-adguard.net")))
$result = Invoke-WebRequest -UseBasicParsing -Uri "https://store.rg-adguard.net/api/GetFiles" `
-Method "POST" `
-WebSession $session `
-Headers @{
"method"="POST"
  "authority"="store.rg-adguard.net"
  "scheme"="https"
  "path"="/api/GetFiles"
  "sec-ch-ua"="`" Not A;Brand`";v=`"99`", `"Chromium`";v=`"99`", `"Microsoft Edge`";v=`"99`""
  "sec-ch-ua-mobile"="?0"
  "sec-ch-ua-platform"="`"Windows`""
  "accept"="*/*"
  "origin"="https://store.rg-adguard.net"
  "sec-fetch-site"="same-origin"
  "sec-fetch-mode"="cors"
  "sec-fetch-dest"="empty"
  "referer"="https://store.rg-adguard.net/"
  "accept-encoding"="gzip, deflate, br"
  "accept-language"="en-US,en;q=0.9"
} `
-ContentType "application/x-www-form-urlencoded" `
-Body "type=url&url=https://www.microsoft.com/en-us/p/microsoft-store/9wzdncrfjbmp&ring=RP&lang=en-US"
$links = $result.Links
foreach($link in $links){
if($link -like "*.AppxBundle*"){
Invoke-WebRequest -Uri $link.href -OutFile C:\MicrosoftStore.AppxBundle -UseBasicParsing
Get-AppxPackage *WindowsStore* | Remove-AppxPackage
Add-AppxPackage -Path C:\MicrosoftStore.AppxBundle
Get-AppXPackage -AllUsers -Name Microsoft.WindowsStore | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" -Verbose}
}
}

#test change
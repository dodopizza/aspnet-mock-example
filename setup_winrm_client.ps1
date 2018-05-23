Write-Host "Y" | Set-Item WSMan:\localhost\Client\TrustedHosts  -Value "*"
winrm "set" "winrm/config/client/auth" "@{Basic=`"true`"}"
winrm "set" "winrm/config/client" "@{AllowUnencrypted=`"true`"}"
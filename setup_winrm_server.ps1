New-LocalUser  deploy -Password (ConvertTo-SecureString "clFjK0INYdAOndE47q" -AsPlainText -Force) -AccountNeverExpires
Add-LocalGroupMember -Group "Administrators" -Member "deploy"
Add-LocalGroupMember -Group "Remote Management Users" -Member "deploy"
Enable-PSRemoting
Set-Item WSMan:\localhost\Client\TrustedHosts  -Value "*" -Force
cmd /K "winrm set winrm/config/service/auth @{Basic=`"true`"}"
cmd /K "winrm set winrm/config/service @{AllowUnencrypted=`"true`"}"
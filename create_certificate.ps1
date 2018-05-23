Import-Module WebAdministration; 

$cert = (New-SelfSignedCertificate -DnsName "tc.example.com" -CertStoreLocation "cert:\LocalMachine\My")
mv ("cert:\LocalMachine\My\"+$cert.Thumbprint) cert:\LocalMachine\AuthRoot;

cd IIS:\SslBindings; 
New-WebBinding -Name "Default Web Site" -IP "*" -Port 443 -Protocol https; 
get-item ("cert:\LocalMachine\AuthRoot\"+$cert.Thumbprint) | new-item 0.0.0.0!443;

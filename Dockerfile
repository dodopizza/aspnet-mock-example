FROM microsoft/aspnet

ADD ./startup.ps1 .

ADD ./wwwroot C:/inetpub/wwwroot/

ADD ./hosts C:/Windows/System32/drivers/etc/hosts

ADD ./disable_windows_update_CA.ps1 ./

ADD ./create_certificate.ps1 . /

ADD ./setup_winrm_client.ps1 ./

ADD ./setup_winrm_server.ps1 ./

RUN ["powershell", "./disable_windows_update_CA.ps1"]

RUN ["powershell", "./create_certificate.ps1"]

RUN ["powershell", "./setup_winrm_client.ps1"]

RUN ["powershell", "./setup_winrm_server.ps1"]

ENTRYPOINT ["powershell", "c:\\startup.ps1"]
FROM microsoft/aspnet

ADD ./startup.ps1 .

ADD ./wwwroot C:/inetpub/wwwroot/

ADD ./hosts C:/Windows/System32/drivers/etc/hosts

ENTRYPOINT ["powershell", "c:\\startup.ps1"]
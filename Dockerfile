FROM microsoft/aspnet

ADD ./startup.ps1 .

ADD ./wwwroot C:/inetpub/wwwroot/

ADD ./hosts C:/Windows/System32/drivers/etc/hosts

ADD ./create_certificate.ps1 ./

RUN ["powershell", "./create_certificate.ps1"]

ENTRYPOINT ["powershell", "c:\\startup.ps1"]
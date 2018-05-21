FROM microsoft/aspnet

ADD ./startup.ps1 .

ENTRYPOINT ["powershell", "c:\\startup.ps1"]
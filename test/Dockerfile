# escape=`
#FROM mcr.microsoft.com/windows/nanoserver:ltsc2022
FROM mcr.microsoft.com/powershell:7.2-nanoserver-ltsc2022
ENTRYPOINT ["pwsh.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; $FormatEnumerationLimit = -1; "]
SHELL      ["pwsh.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; $FormatEnumerationLimit = -1; "]
RUN mkdir C:\test | Out-Null
WORKDIR C:\test
COPY test.ps1 ./
COPY --chown=Guests chown-guests.txt ./
COPY --chown=Administrator chown-administrator.txt ./
COPY --chown=ContainerUser chown-containeruser.txt ./
CMD ["./test.ps1"]

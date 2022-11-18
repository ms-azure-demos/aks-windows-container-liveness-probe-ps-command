FROM mcr.microsoft.com/powershell:lts-7.2-nanoserver-1809 as runtime
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop';"]
COPY liveness.ps1 c:\\liveness.ps1
# this container will be running for total 90 secs.30 secs with file and 60 secs without file. If K8s liveness probe is setup on file, it will terminate in 30secs.
ENTRYPOINT ["pwsh", "-command","mkdir c:\\tmp; set-content -value 'healthy' c:\\tmp\\health.txt; echo 'Created file & wait 60 secs'; Sleep -s 60; del c:\\tmp\\health.txt; echo 'Deleted file & entering day sleep'; Sleep -s (60*60*24);"]

#ENTRYPOINT ["powershell.exe", "-command","mkdir c:\\tmp; sc -value 'healthy' c:\\tmp\\health.txt; Start-Sleep -s 3; del  c:\\tmp\\health.txt; Write-Output 'Deleted file'; Start-Sleep -s 6"]
#ENTRYPOINT ["powershell.exe", "-command","mkdir c:\\tmp; fsutil file createnew c:\\tmp\\health.txt 100; Start-Sleep -s 3; del c:\\tmp\\health.txt; Start-Sleep -s 6"]
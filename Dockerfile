FROM mcr.microsoft.com/windows/servercore:ltsc2019 as runtime
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

# this container will be running for total 90 secs.30 secs with file and 60 secs without file. If K8s liveness probe is setup on file, it will terminate in 30secs.
ENTRYPOINT ["powershell.exe", "-command","sc -value 'healthy' c:\\health.txt; echo 'Created file & wait 30 secs'; Sleep -s 30; del c:\\health.txt; echo 'Deleted file & wait for 60 secs'; Sleep -s 60"]


#ENTRYPOINT ["powershell.exe", "-command","mkdir c:\\tmp; sc -value 'healthy' c:\\tmp\\health.txt; Start-Sleep -s 3; del  c:\\tmp\\health.txt; Write-Output 'Deleted file'; Start-Sleep -s 6"]
#ENTRYPOINT ["powershell.exe", "-command","mkdir c:\\tmp; fsutil file createnew c:\\tmp\\health.txt 100; Start-Sleep -s 3; del c:\\tmp\\health.txt; Start-Sleep -s 6"]
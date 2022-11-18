Get-Date | out-file c:\tmp\probe.log -append # To check liveness probe is getting called.
#Write-output "Test" # This won't work to ensure probe is calling as the output is not coming in kubectl logs
if(-Not (test-path -Path c:\tmp\health.txt)) { throw "File missing. Hence failing."}
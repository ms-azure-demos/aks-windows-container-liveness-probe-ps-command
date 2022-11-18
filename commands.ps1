
########### Test the pod-ps-script-probe.yaml ###########

# this test the built in image. Not the one built above
kubectl apply -f .\pod-ps-script-probe.yaml
kubectl get pods # this will show how many restarts happened
kubectl logs livenesstest # to see logs written from PowerShell
kubectl delete -f .\pod.yaml

########## Building & running  locally ##########
docker build -t joymon/liveness-probe-ps-file:lts-7.2-nanoserver-1809 .
#docker run mcr.microsoft.com/windows/servercore:ltsc2019 cmd /s /c mkdir c:\tmp
docker run joymon/liveness-probe-ps-file:lts-7.2-nanoserver-1809

kubectl apply -f .\pod-ps-file-probe.yaml
kubectl get pods # this will show how many restarts happened

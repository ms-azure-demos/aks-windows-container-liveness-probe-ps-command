########## Building & running  locally ##########
docker build -t livenesstest .
#docker run mcr.microsoft.com/windows/servercore:ltsc2019 cmd /s /c mkdir c:\tmp
docker run livenesstest:latest

############### Test the pod.yaml ###############

# this test the built in image. Not the one built above
kubectl apply -f .\pod.yaml
kubectl get pods # this will show how many restarts happened
kubectl logs livenesstest # to see logs written from PowerShell
kubectl delete -f .\pod.yaml
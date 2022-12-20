kubectl run nginx --image=nginx
kubectl get pods
kubectl get namespaces

alias k="kubectl"
k descride pod nginx

docker -exec -it ID // go inside to container

k get post -o wide //find IP of container
k delete pod nginx

k create deployment nginx-deployment --image=nginx
k scale deployment nginx-deployment —replicas=4 // 4 replicas
k expose deployment nginx-deployment —port 8080 —target-port=80
k get services

k expose deployment k8s-web-hello —type=NodePort —port=3000 //balance ports
k get svc //get services

minikube service k8s-web-hello

k expose deployment k8s-web-hello —type=LoadBalancer —port=3000 

minikube dashboard //open web interface

k apply -f deployment.yml

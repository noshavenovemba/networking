Master:
API server, Scheduler (on which node pod will be), Controller manager (resource control)
Deployment (abstraction over pod)
Pod (abstraction over container)
ConfigMap (external config of app)
SecretFile (secret creds)
Ingress (connection for internal DB)
ProxyServer -> Ingress Controller (external conn)
Volumes
ReplicaSet
PVC (persistent volumes storage -> mount through PV claim)
Helm: values.yam, chart.yaml (metadata)

minikube start --driver=virtualbox

kubectl run nginx --image=nginx
kubectl get pods
kubectl get namespaces
kubectl adons enable ingress
kubens // for namespaces

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

daemonSet // ensures that all (or some) Nodes run a copy of a Pod

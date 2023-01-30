Node: Kubelet (API between container and node), kube-proxy (network interface rules)
MasterNode: API server, Scheduler (start pode on a node), Controller manager (resource control), etcd (cluster brain)

Pod (abstraction over container)
Deployment (abstraction over pod, stateless)
StatefulSet (for apps like databases (stateful))
ConfigMap (external config of app)
SecretFile (secret creds)
Service (pods communicate to each other), you application will be available with:
  ClusterIP (IP inside cluster)
  NodePort (port on all nodes)
  ExternalName (DNS CNAME)
  LoadBalancer (only clouds)
Ingress (connection for internal service)
ProxyServer -> Ingress Controller (external conn)
ExternalService (to access from browser)
Target port: port on which your container(pod) is running // on pod 
Port : port redirects the traffic to the container from the service // on lb
NodePort : port that enables the service to access the externally
ReplicaSet // manage replicas on pod
daemonSet // ensures that all (or some) Nodes run a copy of a Pod
PersistentVolume
PVC (persistent volumes storage -> mount through PV claim)
StorageClass // dynamically creates PVC (provisioner)
no replication of statefull state 

--------- minikube service <name> ---------
minikube start --driver=virtualbox --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1
minikube dashboard //open web interface
--------- kubens //change active namespace ---------

--------- alias k="kubectl" ---------
k get componentstatuses // summary
k cluster-info
k get nodes / pods --watch/ namespaces / services 
k run <name> --image=<name>
k adons enable ingress
k describe pod <name>
k get post -o wide //find IP of container
k delete pod <name>
k create deployment <name> --image=<name>
k port-forward <podname> 8080
k scale deployment <name> —replicas=4 // 4 replicas
k scale deployment <name> —min=4 —max=6 —cpu-percent=80
k autoscale deployment // get hpa // horizontal pod autoscaler
k expose deployment <name> —port 8080 —target-port=80 // create service
k expose deployment <name> —type=NodePort —port=3000 // balance ports
k expose deployment <name> —type=LoadBalancer —port=3000 
k get services // or get svc 
k apply -f deployment.yml --namespace <name>
k rollout history <deployment/depname>
k set image <deployment/depname> <containername>=<imagename> —record // update image
k rollout undo <deployment/depname> —to-revision=4
k rollout restart <deployment/depname>
k rollout status  <deployment/depname> 

--------- helm: template.yaml, values.yaml (default values), chart.yaml (metadata) ---------
helm create MyChart
helm install App1/ -f another_values.yaml
helm install app1 ChartPath/ -- set container.image=<>name> --set replicaCount=5
help upgrade app1 CHartPath/ --set replicaCount=2
helm search hub <name> // search image
helm repo add
helm list

--------- manifest ---------
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-deployment
  labels:
    env: prod
    owner: Vadim
    app: my-k8s-deployment
 spec:
  replicas: 3
  selector:
    matchLabels:
      project: myproject
  template:
    metadata:
      labels:
        project: myproject
    spec:
      containers:
        - name: myname
          image: <image>
          ports:
            - containerPort: 80
      volumes:
        - name: mypd
          persistenVolumeClaim:
            claimName: vpc-name
---
kind: Service
spec:
  ports:
    - name: app_listener
      protocol :tcp
      port :80 /
  type: LoadBalancer
---
kind: Ingress
spec:
  rules:
  - host: myapp.com
    http:
      paths:
      - path: /analytics
        backend:
            serviceName: analytics-service
            servicePort: 8080
      - path: /shopping
        backend:
            serviceName: shopping-service
            servicePort: 8000
---
kind: ConfigMap 
data:
  database: mongodb
  database_uri: mongodb://localhost:27017
---
kind: Secret
type: Opaque
data:
  username:
  password:

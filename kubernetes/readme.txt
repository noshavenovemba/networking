Node: Kubelet (API between container and node), kube-proxy (network interface rules)
MasterNode: API server, Scheduler (start pode on a node), Controller manager (resource control), etcd (cluster brain, key-value information)
liveness probe // check if the container is run and alive
readiness probe // check if the application is ready to send traffic
startup probe // check if when application is started

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
VolumeClaimTemplates // it's a VPC but in statefulset
no replication of statefull state 
labels (find objects), annotations (metadata which doesn't care)
Nodeselector (assign a pod directly to worker node), affinity (assign to the right node, more control)
taint node (no pods to node)
initcontainers // custom code which is not present in image
Cloud->Cluster->Container-Code (security layers)

--------- minikube service <name> ---------
minikube start --driver=virtualbox --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1
minikube dashboard //open web interface
--------- kubens //change active namespace ---------

--------- alias k="kubectl" ---------
k get componentstatuses // summary
k cluster-info
k get po -n kube-system // access etcd
k describe po <etcd-podname> -n kube-system
k get nodes / pods --watch/ namespaces / services 
k run <name> --image=<name>
k adons enable ingress
k describe pod <name>
k get post -o wide //find IP of container
k top
k delete pod <name>
k create deployment <name> --image=<name>
k edit deployment <name>
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
k set image <deployment/depname> <containername>=<imagename> —record // upgrade image
k rollout history deployment <name>
k rollout undo <deployment/depname> —to-revision=4
k rollout restart <deployment/depname>
k rollout status  <deployment/depname> 
k describe <etcd-podname> // show etcd
k get serviceaccounts
k config current-context
k config use-context akscluster

k run nginx --image=nginx --dry-run=client -o yaml

--------- masternode and workernode upgrade ---------
1. apt-get install kubeadm=1.23.3, apt-mark hold kubeadm & kubeadm version
2. kubeadm upgrade plan & kubeadm upgrade apply v1.23.3
3. kubectl drain <nodename> --ignore-daemonsets
4. apt-mark unhold kubeadm, update, hold kubectl
5. systemctl restart kubelet & kubectl uncordon <nodename>

1. apt-get install kubeadm=1.23.3, apt-mark hold kubeadm
2. kubeadm upgrade node
3. kubectl drain <nodename> --ignore-daemonsets
4. apt-mark unhold kubeadm, update, hold kubectl
5. systemctl restart kubelet & kubectl uncordon <nodename>

1. ssh master node
2. ( sudo ETCDCTL_API=3 etcdctl endpoint status --endpoints=ht
tps://172.16.16.129:2379 --cacert=/etc/kubernetes/pki/etcd/
ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/
kubernetes/pki/etcd/server.key --write-out=table )
3. take snapshot 
  sudo ETCDCTL_API=3 etcdctl --endpoints $ENDPOINT snapshot save
snapshotdb      
        AND
  sudo ETCDCTL_API=3 etcdctl snapshot save snapshotdb
--endpoints=https://172.16.16.129:2379
--cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/
kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/
server.key
        OR to restore
  sudo ETCDCTL_API=3 etcdctl --endpoints 172.16.16.129:2379
snapshot restore snapshotdb
4. verify snapshot 
  sudo ETCDCTL_API=3 etcdctl snapshot status snapshotdb --endpo
ints=https://172.16.16.129:2379 --cacert=/etc/kubernetes/pki/
etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/
etc/kubernetes/pki/etcd/server.key --write-out=table


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

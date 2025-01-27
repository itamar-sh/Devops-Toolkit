# Kubernetes Microservices

Kubernetes services provide a way to expose a set of pods as a network service with a stable IP address or DNS name. This simplifies communication between components, as pods' IPs are dynamic and can change frequently. Services also enable load balancing across pods.

#### **Service Types:**

1. **ClusterIP**:
   - Default service type if none is specified.
   - Creates a service with a stable IP address that is **accessible only within the Kubernetes cluster**.
   - Example: A service named `learning-service` routes traffic to pods with the label `app: learning-resources`. Traffic is routed from port 80 on the service to port 3000 on the pods.

2. **NodePort**:
   - Exposes a service on a **specific port (NodePort)** of each Kubernetes node's IP address.
   - Requests to the node's IP and NodePort are forwarded to the service, which load balances traffic to the pods.
   - Example: A service named `echo-service` routes traffic to pods with the label `app: echo-server`. If no port is specified, Kubernetes assigns a port between 30000-32767.
   - **Security Note**: NodePort services expose pods to the internet, so they need careful consideration of security.

3. **LoadBalancer**:
   - Integrates with cloud providers (AWS, GCP, Azure) to provision an **external load balancer**.
   - Traffic to the load balancer's public IP is routed into the cluster and distributed to pods.
   - Example: A `frontend` service directs traffic to pods labeled `app: frontend-ui`.

4. **ExternalName**:
   - Maps a service to an **external DNS name** or IP address, allowing traffic to be routed to resources outside the cluster.
   - Example: A service named `database-service` routes traffic to `my.postgres.database.com` via its `externalName` configuration.

---

### Summary:
- **ClusterIP**: Internal-only communication within the cluster.
- **NodePort**: Exposes services to the internet via node IPs and a specific port.
- **LoadBalancer**: Creates a cloud-based load balancer to expose services externally.
- **ExternalName**: Redirects traffic to external DNS names or IPs, bypassing pod selectors.

Each service type is designed to meet different networking needs in a Kubernetes cluster, ranging from internal communication to exposing workloads to the public.

# Set up cluster and deploy microservices

1) Create cluster with calico:
- ` uname -p `
- ` minikube start --network-plugin=cni --cni=calico -p demo`
- ` kubectl get nodes `
- ` kubectl get pods -A `

Calico is an open-source networking and network security solution for containers, virtual machines, and native host-based workloads. It is widely used in Kubernetes environments to provide networking, network policies, and security features. Calico operates at Layer 3 (network layer) and can handle routing between pods, enabling scalable and performant communication.

CNI Plugin: Integrates with Kubernetes as a Container Network Interface (CNI) plugin, enabling pod networking.

Network Policies: Offers fine-grained control over traffic between pods and external services.

Performance: Uses BGP (Border Gateway Protocol) for scalable routing.

The cluster with calico will support advanced features like:
- Pod IP routing and connectivity.
- Isolation of pods using Calico network policies.
- Enhanced performance with scalable networking

2) Deploy Backend services:
- ` kubectl apply -f learning-resources-api.yaml ` - One deployment and one Cluster IP service.
- ` kubectl apply -f echo-server.yaml ` - One deployment and one NodePort service.
- ` kubectl get pods ` - See 5 pods - 3 Cluster IP services and 2 NodePort services.
- ` kubectl get svc ` - Result will be 3 services. One for each applu and the default kubernetes Cluster IP one.

3) Deploy Frontend services:
- ` kubectl apply -f frontend-ui.yaml ` - One namespace, One deployment and one LoadBalancer service.
- ` kubectl -n frontend get pods `
- ` kubectl -n frontend get svc `

# Send http from busybox service to Cluster IP service learning-resources

4) Deploy busybox pod
- ` kubectl apply -f busybox.yaml `
5) Insert to busybox container
- ` kubectl exec -it busybox -- sh `
6) Make http request from IP, from service name, from DNS server:
General Termianl:
- ` kubectl get pods -o wide `
- ` kubectl get svc `

BusyBox terminal:
- ` wget -O- <ip_address> `
- ` wget -O- learning-service `
- ` wget -O- http://learning-service.default.svc.cluster.local `


# Install minikube and cheatsheet

```
$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.15.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

$ minikube start

# optional to declare vm drivers:
$ minikube start --vm-driver=virtualbox

Starting local Kubernetes cluster...
Running pre-create checks...
Creating machine...
Starting local Kubernetes cluster...

$ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
deployment "hello-minikube" created
$ kubectl expose deployment hello-minikube --type=NodePort
service "hello-minikube" exposed

# We have now launched an echoserver pod but we have to wait until the pod is up before curling/accessing it
# via the exposed service.
# To check whether the pod is up and running we can use the following:
$ kubectl get pod
NAME                              READY     STATUS              RESTARTS   AGE
hello-minikube-3383150820-vctvh   1/1       ContainerCreating   0          3s
# We can see that the pod is still being created from the ContainerCreating status
$ kubectl get pod
NAME                              READY     STATUS    RESTARTS   AGE
hello-minikube-3383150820-vctvh   1/1       Running   0          13s
# We can see that the pod is now Running and we will now be able to curl it:
$ curl $(minikube service hello-minikube --url)
CLIENT VALUES:
client_address=192.168.99.1
command=GET
real path=/
...
$ minikube stop
Stopping local Kubernetes cluster...
Stopping "minikube"...
```

Inspect pods
```
kubectl get pods
```

Inspect deployments
```
kubtctl get deployments
```

In order to access the hello-minikube service, we must first expose the deployment to an external IP via the command:

```
$ kubectl expose deployment hello-minikube --type=NodePort
service "hello-minikube" exposed
```

Get minikube url
```
$ minikube service hello-minikube --url
```
or
```
$ curl $(minikube service hello-minikube --url)
```

Chekck out the minikube dashboard:
```
minikube dashboard

## if you just want the url
minikube dashboard --url
```

Delete deployment,services (exmaple if named hello-node)
```
kubectl delete deployment,service hello-node
```

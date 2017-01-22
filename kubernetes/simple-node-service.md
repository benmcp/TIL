# Simple Kubernetes Setup via the CLI

Start your minikube cluster
```
$ minikube start
Starting local Kubernetes cluster...
```

Create a simple project
```
mkdir hello-node && cd hello-node && touch Dockerfile server.js
```

Update server.js
```
$ vi server.js
var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end('Hello World!');
};
var helloServer = http.createServer(handleRequest);
helloServer.listen(8080);
```

Update Dockerfile
```
$ vi Dockerfile
FROM node:4.4
EXPOSE 8080
COPY server.js .
CMD node server.js
```

Build this
```
docker build -t hello-node:v1 .
```

Check that an image of it exists:
```
$ docker images
REPOSITORY                                            TAG                 IMAGE ID            CREATED             SIZE
hello-node                                            v1                  5cedec3d2f52        About an hour ago   647.4 MB
```

Deploy the hello-node pod to our local Kubernetes cluster via kubectl
```
$ kubectl run hello-node --image=hello-node:v1 --port=8080 --image-pull-policy=IfNotPresent
deployment "hello-node" created
```

Note: `--image-pull-policy=IfNotPresent` updates your image pull policy to source images locally, thus giving access to your locally created `hello-node:v1`. By default this flag is set to `Never`.
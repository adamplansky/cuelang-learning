package kube

#KUBECONTEXT: "minikube"

App: "nginx-dev": {
	Namespace:     "nginx"
	Replicas:      3
	ContainerPort: 80
	Image:         "nginx:latest"
}

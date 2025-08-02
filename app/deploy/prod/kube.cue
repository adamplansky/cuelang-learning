package kube

#KUBECONTEXT: "prod"

App: "nginx-prod": {
	Namespace:     "nginx-prod"
	Replicas:      10
	ContainerPort: 80
	Image:         "nginx-prod:latest"
}

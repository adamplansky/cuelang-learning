package kube

#KUBECONTEXT: "minikube"

input: {
	name:      "nginx-dev"
	namespace: "my-namespace"
	replicas:  3
}

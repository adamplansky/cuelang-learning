package kube

#KUBECONTEXT: "prod"

input: {
	name:      "nginx"
	namespace: "prod-nginx"
	replicas:  10
}

package kube

App: [Name=string]: {
	Namespace!:    string
	Replicas:      int & >=1 | *1
	ContainerPort: int | *80
	Image:         string | *"nginx:latest"

	service: {
		apiVersion: "v1"
		kind:       "Service"
		metadata: {
			name:      Name
			namespace: Namespace
		}
		spec: {
			selector: app: Name
			ports: [{
				protocol:   "TCP"
				port:       80
				targetPort: ContainerPort
			}]
			type: "ClusterIP"
		}
	}
	deployment: {
		apiVersion: "apps/v1"
		kind:       "Deployment"
		metadata: {
			name:      Name
			namespace: Namespace
			labels: app: Name
		}
		spec: {
			replicas: Replicas
			selector: matchLabels: app: Name
			template: {
				metadata: labels: app: Name
				spec: containers: [{
					name:  Name
					image: Image
					ports: [{containerPort: ContainerPort}]
				}]
			}
		}
	}
}

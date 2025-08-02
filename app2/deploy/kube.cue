package kube

#Input: {
	name:      string
	namespace: string | *"default"
	replicas:  int & >=1 | *1
}

input: #Input

_containerPort: 80

service: (input.name): {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      input.name
		namespace: input.namespace
	}
	spec: {
		selector: app: "nginx"
		ports: [{
			protocol:   "TCP"
			port:       80
			targetPort: _containerPort
		}]
		type: "ClusterIP"
	}
}

deployment: (input.name): {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      input.name
		namespace: input.namespace

		labels: app: "nginx"
	}
	spec: {
		replicas: input.replicas
		selector: matchLabels: app: "nginx"
		template: {
			metadata: labels: app: "nginx"
			spec: containers: [{
				name:  "nginx"
				image: "nginx:1.14.2"
				ports: [{containerPort: _containerPort}]
			}]
		}
	}
}

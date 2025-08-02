package kube

import (
	"k8s.io/api/core/v1"
)

// #context: string

// [#context]: service: [string]: v1.#Service

service: [string]: v1.#Service
service: "my-service": {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "my-service"
		namespace: "default"
	}
	spec: {
		selector: app: "my-app"
		ports: [{
			protocol:   "TCP"
			port:       80
			targetPort: 8080
		}]
		type: "ClusterIP"
	}
}

// dev: service: "my-service": {
// 	apiVersion: "v1"
// 	kind:       "Service"
// 	metadata: {
// 		name:      "my-service"
// 		namespace: "default"
// 	}
// 	spec: {
// 		selector: app: "my-app"
// 		ports: [{
// 			protocol:   "TCP"
// 			port:       80
// 			targetPort: 8080
// 		}]
// 		type: "ClusterIP"
// 	}
// }

// prod: service: "my-service": {
// 	apiVersion: "v1"
// 	kind:       "Service"
// 	metadata: {
// 		name:      "my-service"
// 		namespace: "default"
// 	}
// 	spec: {
// 		selector: app: "my-app"
// 		ports: [{
// 			protocol:   "TCP"
// 			port:       80
// 			targetPort: 8080
// 		}]
// 		type: "ClusterIP"
// 	}
// }

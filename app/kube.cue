package kube

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

#KUBECONTEXT!: string

App: [string]: {
	service:    v1.#Service
	deployment: apps_v1.#Deployment
}

objects: [
	for appName, app in App
	for k, v in {
		service:    app.service
		deployment: app.deployment
	} {v},
]

// #KUBECONTEXT!: string
//
// service: [string]: v1.#Service
// service: [Name=_]: {
// 	metadata: name: Name
// }
//
// deployment: [string]: apps_v1.#Deployment
// deployment: [Name=_]: {
// 	metadata: name: Name
// }
//
// objects: [
// 	for obj in objectsList
// 	for k, v in obj {v},
// ]
//
// objectsList: [
// 	service, deployment,
// ]

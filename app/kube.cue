package kube

import (
	"k8s.io/api/core/v1"
)

service: [string]: v1.#Service

objects: [
	for k, v in service {v},
]

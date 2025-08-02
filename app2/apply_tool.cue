package kube

import (
	"tool/cli"
	"tool/exec"
	"encoding/yaml"
)

// cue cmd apply ./deploy/dev
command: apply: {
	task: kube: exec.Run & {
		cmd:    "kubectl --context \(#KUBECONTEXT) create --dry-run=client -f -"
		stdin:  yaml.MarshalStream(objects)
		stdout: string
	}

	task: display: cli.Print & {
		text: task.kube.stdout
	}
}

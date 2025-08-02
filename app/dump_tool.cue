package kube

import (
	"tool/cli"
	"encoding/yaml"
)

// cue cmd gen ./data
command: gen: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}

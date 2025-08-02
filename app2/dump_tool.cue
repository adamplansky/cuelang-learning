package kube

import (
	"tool/cli"
	"encoding/yaml"
)

// cue cmd dump ./deploy/dev
command: dump: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}

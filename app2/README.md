
cue cmd gen ./deploy/prod
cue cmd gen ./deploy/dev


If I forget some key value:
```
cue vet ./deploy/dev  -c
input.name: incomplete value string:
    ./deploy/kube.cue:4:13
service: key value of dynamic field must be concrete, found string:
    ./deploy/kube.cue:13:11
    ./deploy/kube.cue:4:13
deployment: key value of dynamic field must be concrete, found string:
    ./deploy/kube.cue:31:14
    ./deploy/kube.cue:4:13
```

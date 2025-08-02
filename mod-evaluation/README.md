# mod-eval

explanation how the module are evaluated


```cue
cue eval .:a
"exported-from-different-package":        "a"
"exported-from-different-package-schema": "a"
labels: {
    name:  "Adam"
    color: "green"
}


cue eval ./parent/a/a.cue
child: "a"

cue eval ./parent/a/
child:                                    "a"
"exported-from-different-package":        "a"
"exported-from-different-package-schema": "a"
labels: {
    name:  "Adam"
    color: "green"
}
parent: "parent-a"
```

```bash
cue eval .:b
root: "b"

cue eval ./parent:b
root: "b"

!!!!!!!!!!!! Always use ./xx/y for relative path
cue eval parent/b:b
standard library import path "parent/b:b" cannot be imported as a CUE package


cue eval github.com/adamplansky/cuelang-learning/mod-evaluation:a
"exported-from-different-package":        "a"
"exported-from-different-package-schema": "a"
labels: {
    name:  "Adam"
    color: "green"
}

cue eval ./parent/b:b
b:    "b"
root: "b"
```

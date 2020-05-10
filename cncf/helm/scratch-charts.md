# scratch charts

https://helm.sh/docs/chart_template_guide/getting_started/

```console 
$ helm create mychart
```

```console
$ tree mychart/ 
mychart/
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml

3 directories, 8 files
```

```console
$ rm -rf mychart/templates/*
```


`mychart/templates/configmap.yaml`

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mychart-configmap
data:
  myvalue: "Hello World"
```


```console
$ helm install full-coral ./mychart/
NAME: full-coral
LAST DEPLOYED: Sun May 10 19:22:35 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

```console
$ helm get manifest full-coral
---
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mychart-configmap
data:
  myvalue: "Hello World"
```

```console
$ helm uninstall full-coral
release "full-coral" uninstalled
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  myvalue: "Hello World"
```

`name:` field is limited to 63.

```console
$ helm install clunky-serval ./mychart
NAME: clunky-serval
LAST DEPLOYED: Sun May 10 19:29:21 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
```

```console
helm get manifest clunky-serval
---
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: clunky-serval-configmap
data:
  myvalue: "Hello World"
```


debug

```console
$ helm install --debug --dry-run goodly-guppy ./mychart
install.go:159: [debug] Original chart version: ""
install.go:176: [debug] CHART PATH: /home/ec2-user/mychart

NAME: goodly-guppy
LAST DEPLOYED: Sun May 10 19:32:45 2020
NAMESPACE: default
STATUS: pending-install
REVISION: 1
TEST SUITE: None
USER-SUPPLIED VALUES:
{}

COMPUTED VALUES:
affinity: {}
autoscaling:
  enabled: false
  maxReplicas: 100
  minReplicas: 1
  targetCPUUtilizationPercentage: 80
fullnameOverride: ""
image:
  pullPolicy: IfNotPresent
  repository: nginx
  tag: ""
imagePullSecrets: []
ingress:
  annotations: {}
  enabled: false
  hosts:
  - host: chart-example.local
    paths: []
  tls: []
nameOverride: ""
nodeSelector: {}
podAnnotations: {}
podSecurityContext: {}
replicaCount: 1
resources: {}
securityContext: {}
service:
  port: 80
  type: ClusterIP
serviceAccount:
  annotations: {}
  create: true
  name: ""
tolerations: []

HOOKS:
MANIFEST:
---
# Source: mychart/templates/configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: goodly-guppy-configmap
data:
  myvalue: "Hello World"
```

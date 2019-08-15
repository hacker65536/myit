https://docs.npmjs.com/

```console
$ npm config list
; cli configs
metrics-registry = "https://registry.npmjs.org/"
scope = ""
user-agent = "npm/5.6.0 node/v8.10.0 linux x64"

; node bin location = /home/ec2-user/.anyenv/envs/ndenv/versions/v8.10.0/bin/node
; cwd = /home/ec2-user/graphql
; HOME = /home/ec2-user
; "npm config ls -l" to show all defaults.
```




tips
--

```
$ npm i -g aws-cdk
npm ERR! Can't install /home/ec2-user/aws-cdk: Missing package version

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/ec2-user/.npm/_logs/2019-08-15T02_50_45_137Z-debug.log
```



mv directory to other place , install again 


```
$ mkdir works
$ mv aws-cdk works/
$ npm i -g aws-cdk
```




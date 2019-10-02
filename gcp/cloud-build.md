# Cloud Build

https://cloud.google.com/cloud-build/

quickstart for docker
--

https://cloud.google.com/cloud-build/docs/quickstart-docker


enable the cloud build api

https://console.cloud.google.com/flows/enableapi?apiid=cloudbuild.googleapis.com



quickstart for docker
--


`quickstart.sh`
```bash
#!/bin/sh
echo "Hello, world! The time is $(date)."
```

`Dockerfile`
```dockerfile
FROM alpine
COPY quickstart.sh /
CMD ["/quickstart.sh"]
```

```console
$ chmod +x quickstart.sh
```

```console
$ gcloud builds submit --tag gcr.io/prj-13254/quickstart-image .
Creating temporary tarball archive of 2 file(s) totalling 108 bytes before compression.
Uploading tarball of [.] to [gs://prj-13254_cloudbuild/source/1569975774.24-275ae457238d4a5a9b86394905c7b389.tgz]
Created [https://cloudbuild.googleapis.com/v1/projects/prj-13254/builds/7b44c116-90f8-46a5-a02c-4b9efa4deb9a].
Logs are available at [https://console.cloud.google.com/gcr/builds/7b44c116-90f8-46a5-a02c-4b9efa4deb9a?project=505651080755].
---------------------------------------------------------- REMOTE BUILD OUTPUT ----------------------------------------------------------
starting build "7b44c116-90f8-46a5-a02c-4b9efa4deb9a"

FETCHSOURCE
Fetching storage object: gs://prj-13254_cloudbuild/source/1569975774.24-275ae457238d4a5a9b86394905c7b389.tgz#1569975775017238
Copying gs://prj-13254_cloudbuild/source/1569975774.24-275ae457238d4a5a9b86394905c7b389.tgz#1569975775017238...
/ [1 files][  264.0 B/  264.0 B]
Operation completed over 1 objects/264.0 B.
BUILD
Already have image (with digest): gcr.io/cloud-builders/docker
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM alpine
latest: Pulling from library/alpine
Digest: sha256:acd3ca9941a85e8ed16515bfc5328e4e2f8c128caa72959a58a127b7801ee01f
Status: Downloaded newer image for alpine:latest
 ---> 961769676411
Step 2/3 : COPY quickstart.sh /
 ---> 8ab78d3b2099
Step 3/3 : CMD ["/quickstart.sh"]
 ---> Running in 9debfaf203e6
Removing intermediate container 9debfaf203e6
 ---> f5308ede2f92
Successfully built f5308ede2f92
Successfully tagged gcr.io/prj-13254/quickstart-image:latest
PUSH
Pushing gcr.io/prj-13254/quickstart-image
The push refers to repository [gcr.io/prj-13254/quickstart-image]
bbf484bd43db: Preparing
03901b4a2ea8: Preparing
03901b4a2ea8: Layer already exists
bbf484bd43db: Pushed
latest: digest: sha256:6207a8268556bcee6542c5cf0ea6f0e7902af89e9ac141229c1cb41ad7c588b2 size: 735
DONE
-----------------------------------------------------------------------------------------------------------------------------------------

ID                                    CREATE_TIME                DURATION  SOURCE                                                                                       IMAGES                                               STATUS
7b44c116-90f8-46a5-a02c-4b9efa4deb9a  2019-10-02T00:22:55+00:00  13S       gs://prj-13254_cloudbuild/source/1569975774.24-275ae457238d4a5a9b86394905c7b389.tgz  gcr.io/prj-13254/quickstart-image (+1 more)  SUCCESS
```


View the build details

https://console.cloud.google.com/cloud-build/builds

 run docker
 --
 
 ```
 $ gcloud auth configure-docker
 ```

```
The following settings will be added to your Docker config file
located at [/home/ec2-user/.docker/config.json]:
 {
  "credHelpers": {
    "gcr.io": "gcloud",
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud",
    "marketplace.gcr.io": "gcloud"
  }
}

Do you want to continue (Y/n)?  Y

Docker configuration file updated.
```

```console
$ docker run --rm gcr.io/prj-13254/quickstart-image
Unable to find image 'gcr.io/prj-13254/quickstart-image:latest' locally
latest: Pulling from prj-13254/quickstart-image
9d48c3bd43c5: Pull complete
14be37a2801e: Pull complete
Digest: sha256:6207a8268556bcee6542c5cf0ea6f0e7902af89e9ac141229c1cb41ad7c588b2
Status: Downloaded newer image for gcr.io/prj-13254/quickstart-image:latest
Hello, world! The time is Wed Oct  2 00:34:07 UTC 2019.
```

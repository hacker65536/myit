
```
gcloud beta container --project "gke-pj-test" clusters create "cluster-2" \
--zone "us-central1-a" \
--username="admin" \
--cluster-version "1.7.8-gke.0" \
--machine-type "n1-standard-2" \
--image-type "COS" \
--disk-size "100" \
--scopes "https://www.googleapis.com/auth/compute",\
"https://www.googleapis.com/auth/devstorage.read_only",\
"https://www.googleapis.com/auth/logging.write",\
"https://www.googleapis.com/auth/monitoring",\
"https://www.googleapis.com/auth/servicecontrol",\
"https://www.googleapis.com/auth/service.management.readonly",\
"https://www.googleapis.com/auth/trace.append" \
--num-nodes "2" \
--network "default" \
--enable-cloud-logging \
--enable-cloud-monitoring \
--subnetwork "default" \
--enable-legacy-authorization
```

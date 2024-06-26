locally codebuild
===============

https://aws.amazon.com/blogs/devops/announcing-local-build-support-for-aws-codebuild/

env
--------

```
$ cat /etc/system-release
Amazon Linux release 2 (2017.12) LTS Release Candidate
$ uname -r
4.14.26-54.32.amzn2.x86_64
```

init
---------

```
sudo yum install -y docker git
sudo systemctl start docker
sudo usermod  -a -G docker ec2-user
newgrp docker
```

build codebuild image locally
-----------

```bash
git clone https://github.com/aws/aws-codebuild-docker-images.git
cd !$:t:r/ubuntu/java/openjdk-8
sed -e '$d' -i Dockerfile  # remove last line ENTRYPOINT ["dockerd-entrypoint.sh"]
docker build -t aws/codebuild/java:openjdk-8 .
```

setup codebuild local agent
-----------

```
docker pull amazon/aws-codebuild-local:latest --disable-content-trust=false
```

build a sample project on local
----------
```
git clone https://github.com/karthiksambandam/sample-web-app.git
cd !$:t:r
cat <<'EOF' > buildspec.yml
version: 0.2

phases:
  build:
    commands:
      - echo Build started on `date`
      - mvn install

artifacts:
  files:
    - target/javawebdemo.war
EOF
```

```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock \
-e "IMAGE_NAME=aws/codebuild/java:openjdk-8" \
-e "ARTIFACTS=/home/ec2-user/artifacts" \
-e "SOURCE=/home/ec2-user/sample-web-app" amazon/aws-codebuild-local
```

```
Removing network agentresources_default
Removing volume agentresources_user_volume
Removing volume agentresources_source_volume
Creating network "agentresources_default" with the default driver
Creating volume "agentresources_user_volume" with local driver
Creating volume "agentresources_source_volume" with local driver
Creating agentresources_agent_1 ...
Creating agentresources_agent_1 ... done
Creating agentresources_build_1 ...
Creating agentresources_build_1 ... done
Attaching to agentresources_agent_1, agentresources_build_1
build_1  | [Container] 2018/05/08 02:48:12 Waiting for agent ping
build_1  | [Container] 2018/05/08 02:48:12 Waiting for DOWNLOAD_SOURCE
build_1  | [Container] 2018/05/08 02:48:13 Phase is DOWNLOAD_SOURCE
build_1  | [Container] 2018/05/08 02:48:13 CODEBUILD_SRC_DIR=/codebuild/output/src264912828/src
build_1  | [Container] 2018/05/08 02:48:13 YAML location is /codebuild/output/src264912828/src/buildspec.yml
build_1  | [Container] 2018/05/08 02:48:13 Processing environment variables
build_1  | [Container] 2018/05/08 02:48:13 Moving to directory /codebuild/output/src264912828/src
build_1  | [Container] 2018/05/08 02:48:13 Registering with agent
build_1  | [Container] 2018/05/08 02:48:13 Phases found in YAML: 1
build_1  | [Container] 2018/05/08 02:48:13  BUILD: 2 commands
build_1  | [Container] 2018/05/08 02:48:13 [BUILD UPLOAD_ARTIFACTS]
build_1  | [Container] 2018/05/08 02:48:13 Phase complete: DOWNLOAD_SOURCE Success: true
build_1  | [Container] 2018/05/08 02:48:13 Phase context status code:  Message:
build_1  | [Container] 2018/05/08 02:48:13 Entering phase INSTALL
build_1  | [Container] 2018/05/08 02:48:13 Phase complete: INSTALL Success: true
build_1  | [Container] 2018/05/08 02:48:13 Phase context status code:  Message:
build_1  | [Container] 2018/05/08 02:48:13 Entering phase PRE_BUILD
build_1  | [Container] 2018/05/08 02:48:13 Phase complete: PRE_BUILD Success: true
build_1  | [Container] 2018/05/08 02:48:13 Phase context status code:  Message:
build_1  | [Container] 2018/05/08 02:48:13 Entering phase BUILD
build_1  | [Container] 2018/05/08 02:48:13 Running command echo Build started on `date`
build_1  | [Container] 2018/05/08 02:48:13 Running command mvn install
build_1  | [Container] 2018/05/08 02:48:30 Phase complete: BUILD Success: true
build_1  | [Container] 2018/05/08 02:48:30 Phase context status code:  Message:
build_1  | [Container] 2018/05/08 02:48:30 Entering phase POST_BUILD
build_1  | [Container] 2018/05/08 02:48:30 Phase complete: POST_BUILD Success: true
build_1  | [Container] 2018/05/08 02:48:30 Phase context status code:  Message:
build_1  | [Container] 2018/05/08 02:48:30 Preparing to copy artifacts
build_1  | [Container] 2018/05/08 02:48:30 Expanding base directory path: .
build_1  | [Container] 2018/05/08 02:48:30 Assembling file list
build_1  | [Container] 2018/05/08 02:48:30 Expanding .
build_1  | [Container] 2018/05/08 02:48:30 Expanding artifact file paths for base directory .
build_1  | [Container] 2018/05/08 02:48:30 Assembling file list
build_1  | [Container] 2018/05/08 02:48:30 Expanding target/javawebdemo.war
build_1  | [Container] 2018/05/08 02:48:30 Found 1 file(s)
build_1  | [Container] 2018/05/08 02:48:30 Phase complete: UPLOAD_ARTIFACTS Success: true
build_1  | [Container] 2018/05/08 02:48:30 Phase context status code:  Message:
agentresources_build_1 exited with code 0
```

```
$ unzip -l artifacts/artifacts.zip
Archive:  artifacts/artifacts.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
 10938403  05-08-2018 02:48   target/javawebdemo.war
---------                     -------
 10938403                     1 file
```


inspect
-----------

master ?
```
$ docker ps -a
CONTAINER ID        IMAGE                          COMMAND                  CREATED             STATUS                      PORTS                     NAMES
98b88bde0fad        aws/codebuild/java:openjdk-8   "sh -c 'while [ ! ..."   22 minutes ago      Exited (0) 22 minutes ago                             agentresources_build_1
6050961813c6        amazon/aws-codebuild-local     "local_build.sh"         22 minutes ago      Up 22 minutes               0.0.0.0:32771->3000/tcp   agentresources_agent_1
2f398895d7f7        amazon/aws-codebuild-local     "local_build.sh"         22 minutes ago      Up 22 minutes                                         wonderful_kirch
```

```
$ docker exec -it 2f398895d7f7 bash
bash-4.2# cd agent-resources/
bash-4.2# ls
bin  docker-compose.yml  local-build-config.yml  start
bash-4.2# cat docker-compose.yml
version: '2'

services:
  agent:
    image: ${LOCAL_AGENT_IMAGE}
    ports:
     - "3000"
    volumes:
     - source_volume:/codebuild/input
     - user_volume:/codebuild/output:ro
     - ${CODEBUILD_LOCAL_SOURCE_DIRECTORY}:/codebuild/local:ro     # Mount this to pass the build data yml file which local-CTS will use to return build info.
    environment:
     - CODEBUILD_LOCAL_BUILD=true                                  # Go-agent attempts to connect to local CTS
     - AWS_ACCESS_KEY_ID=key                                       # Prevent going to EC2 instance metadata.
     - AWS_SECRET_ACCESS_KEY=secret                                # Prevent going to EC2 instance metadata.
     - CODEBUILD_LOCAL_ECS_AGENT_ACCESS_KEY=
     - CODEBUILD_LOCAL_ECS_AGENT_SECRET_KEY=
     - CODEBUILD_LOCAL_ECS_AGENT_SESSION_TOKEN=
     - CODEBUILD_CONTAINER_TOKENS=12345
     - AWS_CONTAINER_CREDENTIALS_RELATIVE_URI=/credentials
     - CODEBUILD_REGION=us-west-2                                  # Provides region to use for CTS connection in BMR
     - CODEBUILD_CTS_ENDPOINT=http://localhost:8100
     - CODEBUILD_LOCAL_ECS_AGENT=true
     - CODEBUILD_GOLANG_AGENT=true
     - CODEBUILD_LOCAL_BUILD_DATA_FILE=/LocalBuild/agent-resources/local-build-config.yml
     - IS_INNER_CONTAINER=true
  build:
    image: ${IMAGE_FOR_CODEBUILD_LOCAL_BUILD}
    command: sh -c "while [ ! -f /codebuild/readonly/bin/executor.done ]; do sleep 1; done && /codebuild/readonly/bin/executor"
    volumes:
     - source_volume:/codebuild/readonly:ro
     - user_volume:/codebuild/output
     - ${CODEBUILD_LOCAL_ARTIFACTS_DIRECTORY}:/codebuild/output/artifacts
    environment:
     - CODEBUILD_AGENT_PORT=http://BMR:3000
     - CODEBUILD_AUTH_TOKEN=12345
    links:
     - "agent:BMR"
volumes:
  source_volume:
    driver: local
  user_volume:
    driver: local
```
```
bash-4.2# env | sort
ARTIFACTS=/home/ec2-user/artifacts
DIND_COMMIT=3b5fac462d21ca164b3778647420016315289034
DOCKER_BUCKET=download.docker.com
DOCKER_CHANNEL=stable
DOCKER_COMPOSE_VERSION=1.16.1
DOCKER_SHA256=a9e90a73c3cdfbf238f148e1ec0eaff5eb181f92f35bdd938fd7dab18e1c4647
DOCKER_VERSION=17.09.0-ce
HOME=/root
HOSTNAME=2f398895d7f7
IMAGE_NAME=aws/codebuild/java:openjdk-8
IS_INNER_CONTAINER=false
OLDPWD=/LocalBuild
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/LocalBuild/agent-resources
SHLVL=1
SOURCE=/home/ec2-user/sample-web-app
TERM=xterm
_=/usr/bin/env
```

agent
```
$ docker exec -it 6050961813c6 bash

bash-4.2# env | sort
AWS_ACCESS_KEY_ID=key
AWS_CONTAINER_CREDENTIALS_RELATIVE_URI=/credentials
AWS_SECRET_ACCESS_KEY=secret
CODEBUILD_CONTAINER_TOKENS=12345
CODEBUILD_CTS_ENDPOINT=http://localhost:8100
CODEBUILD_GOLANG_AGENT=true
CODEBUILD_LOCAL_BUILD=true
CODEBUILD_LOCAL_BUILD_DATA_FILE=/LocalBuild/agent-resources/local-build-config.yml
CODEBUILD_LOCAL_ECS_AGENT=true
CODEBUILD_LOCAL_ECS_AGENT_ACCESS_KEY=
CODEBUILD_LOCAL_ECS_AGENT_SECRET_KEY=
CODEBUILD_LOCAL_ECS_AGENT_SESSION_TOKEN=
CODEBUILD_REGION=us-west-2
DIND_COMMIT=3b5fac462d21ca164b3778647420016315289034
DOCKER_BUCKET=download.docker.com
DOCKER_CHANNEL=stable
DOCKER_COMPOSE_VERSION=1.16.1
DOCKER_SHA256=a9e90a73c3cdfbf238f148e1ec0eaff5eb181f92f35bdd938fd7dab18e1c4647
DOCKER_VERSION=17.09.0-ce
HOME=/root
HOSTNAME=6050961813c6
IS_INNER_CONTAINER=true
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/LocalBuild
SHLVL=1
TERM=xterm
_=/usr/bin/env

bash-4.2# cd agent-resources/
bash-4.2# ls -la
total 16
drwxr-xr-x 1 root root   29 May  8 03:22 .
drwxr-xr-x 1 root root   29 May  3 18:19 ..
drwxr-xr-x 2 root root  206 May  3 18:19 bin
-rw-r--r-- 1 root root    3 May  8 03:22 build-agent.pid
-rw-r--r-- 1 root root 1840 May  3 18:10 docker-compose.yml
-rw-r--r-- 1 root root  403 Apr 30 17:46 local-build-config.yml
-rwxr-xr-x 1 root root  707 Apr 30 17:46 start
```

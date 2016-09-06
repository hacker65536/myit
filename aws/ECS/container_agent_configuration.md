

ecs.confg
===============

all of them are optional.

| Environment Key| Example Values | Default|
|--------------- | ---------------| -------|
| ECS_CLUSTER|  MyCluster| Default |
| ECS_RESERVED_PORTS | [22, 80, 5000, 8080]| [22, 2375, 2376, 51678] |
| ECS_RESERVED_PORTS_UDP | [53, 123] | [] |
| ECS_ENGINE_AUTH_TYPE | dockercfg \| docker | Null |
| ECS_ENGINE_AUTH_DATA |Example (ECS_ENGINE_AUTH_TYPE=dockercfg):<br>{"https://index.docker.io/v1/":<br{"auth":"zq212MzEXAMPLE7o6T25Dk0i",<br>"email":"email@example.com"}}<br>Example (ECS_ENGINE_AUTH_TYPE=docker):<br >{"https://index.docker.io/v1/":<br>{"username":"my_name","password":"my_password",<br>"email":"email@example.com"}} | Null |
| AWS_DEFAULT_REGION | us-east-1 | Taken from EC2 instance metadata. |
| AWS_ACCESS_KEY_ID | AKIAIOSFODNN7EXAMPLE | Taken from EC2 instance metadata. |
| AWS_SECRET_ACCESS_KEY | wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY | 	Taken from EC2 instance metadata. |
| DOCKER_HOST | unix:///var/run/docker.sock | unix:///var/run/docker.sock |
| ECS_LOGLEVEL | crit \| error \| warn \| info \| debug | info |
| ECS_LOGFILE | /ecs-agent.log |  Null |
| ECS_CHECKPOINT | true \| false | if(!empty()){<br> return true;<br>}else{<br>return false;<br>} |

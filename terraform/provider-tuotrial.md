# terraform provider tutorial

https://learn.hashicorp.com/collections/terraform/providers


```console
$ git clone --branch boilerplate https://github.com/hashicorp/terraform-provider-hashicups
$ cd terraform-provider-hashicups
```

running instance of hashicups from docker-compose
```console
$ cd docker_compose && docker-compose up
```

<details><summary>docker stdoout</summary>

<pre><code>
$ docker-compose up
Creating docker_compose_db_1 ... done
Creating docker_compose_api_1 ... done
Attaching to docker_compose_db_1, docker_compose_api_1
db_1   | The files belonging to this database system will be owned by user "postgres".
db_1   | This user must also own the server process.
db_1   |
db_1   | The database cluster will be initialized with locale "en_US.utf8".
db_1   | The default database encoding has accordingly been set to "UTF8".
db_1   | The default text search configuration will be set to "english".
db_1   |
db_1   | Data page checksums are disabled.
db_1   |
db_1   | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db_1   | creating subdirectories ... ok
db_1   | selecting default max_connections ... 100
db_1   | selecting default shared_buffers ... 128MB
db_1   | selecting default timezone ... Etc/UTC
db_1   | selecting dynamic shared memory implementation ... posix
db_1   | creating configuration files ... ok
db_1   | running bootstrap script ... ok
api_1  | 2020-09-10T15:13:36.728Z [ERROR] Unable to connect to database: error="dial tcp 172.18.0.2:5432: connect: connection refused"
db_1   | performing post-bootstrap initialization ... ok
db_1   | syncing data to disk ... ok
db_1   |
db_1   | WARNING: enabling "trust" authentication for local connections
db_1   | You can change this by editing pg_hba.conf or using the option -A, or
db_1   | --auth-local and --auth-host, the next time you run initdb.
db_1   |
db_1   | Success. You can now start the database server using:
db_1   |
db_1   |     pg_ctl -D /var/lib/postgresql/data -l logfile start
db_1   |
db_1   | waiting for server to start....2020-09-10 15:13:36.991 UTC [44] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2020-09-10 15:13:37.005 UTC [45] LOG:  database system was shut down at 2020-09-10 15:13:36 UTC
db_1   | 2020-09-10 15:13:37.010 UTC [44] LOG:  database system is ready to accept connections
db_1   |  done
db_1   | server started
db_1   | CREATE DATABASE
db_1   |
db_1   |
db_1   | /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/products.sql
db_1   | SET
db_1   | CREATE EXTENSION
db_1   | CREATE TABLE
db_1   | CREATE TABLE
db_1   | CREATE TABLE
db_1   | CREATE TABLE
db_1   | CREATE TABLE
db_1   | CREATE TABLE
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   | INSERT 0 1
db_1   |
db_1   |
db_1   | 2020-09-10 15:13:37.466 UTC [44] LOG:  received fast shutdown request
db_1   | waiting for server to shut down....2020-09-10 15:13:37.467 UTC [44] LOG:  aborting any active transactions
db_1   | 2020-09-10 15:13:37.469 UTC [44] LOG:  background worker "logical replication launcher" (PID 51) exited with exit code 1
db_1   | 2020-09-10 15:13:37.471 UTC [46] LOG:  shutting down
db_1   | 2020-09-10 15:13:37.492 UTC [44] LOG:  database system is shut down
db_1   |  done
db_1   | server stopped
db_1   |
db_1   | PostgreSQL init process complete; ready for start up.
db_1   |
db_1   | 2020-09-10 15:13:37.577 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2020-09-10 15:13:37.577 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2020-09-10 15:13:37.580 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2020-09-10 15:13:37.593 UTC [71] LOG:  database system was shut down at 2020-09-10 15:13:37 UTC
db_1   | 2020-09-10 15:13:37.597 UTC [1] LOG:  database system is ready to accept connections
api_1  | 2020-09-10T15:13:37.734Z [INFO]  Starting service: bind=0.0.0.0:9090 metrics=localhost:9102
</code></pre>
</details>


```console
$ curl localhost:19090/health
ok
```


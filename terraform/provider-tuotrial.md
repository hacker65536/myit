# terraform provider tutorial

https://learn.hashicorp.com/collections/terraform/providers

Set up development environment
--
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


Explore develpment environment
--


change to appropriate `OS_ARCH`

`Makefile`

```diff
-OS_ARCH=darwin_amd64
+OS_ARCH=$$(go env GOOS)_$$(go env GOARCH)
```

go mod init
```console
$ go mod init terraform-provider-hashicups
$ go mod vendor
```

`main.go`
```go
package main

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/v2/plugin"

	"terraform-provider-hashicups/hashicups"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: func() *schema.Provider {
			return hashicups.Provider()
		},
	})
}
```
`ProviderFunc` returns a `*schema.Provider` from the `hashicups` package.

`hashicups/provider.go`
```go
package hashicups

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

// Provider -
func Provider() *schema.Provider {
	return &schema.Provider{
		ResourcesMap:   map[string]*schema.Resource{},
		DataSourcesMap: map[string]*schema.Resource{},
	}
}
```
`*schema.Provider` contains `ResourcesMap` and `DataSourcesMap`

```console
$ make build
go build -o terraform-provider-hashicups
```

```console
$ ./terraform-provider-hashicups
This binary is a plugin. These are not meant to be executed directly.
Please execute the program that consumes these plugins, which will
load any plugins automatically
```

Define coffees data resource

`hashicups/data_source_coffee.go`
```go
package hashicups

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func dataSourceCoffees() *schema.Resource {
	return &schema.Resource{
		ReadContext: dataSourceCoffeesRead,
		Schema:      map[string]*schema.Schema{},
	}
}
```

Define coffees schema and Implement read


```console
$ curl -SsL localhost:19090/coffees| jq .
```

```json
[
  {
    "id": 1,
    "name": "Packer Spiced Latte",
    "teaser": "Packed with goodness to spice up your images",
    "description": "",
    "price": 350,
    "image": "/packer.png",
    "ingredients": [
      {
        "ingredient_id": 1
      },
      {
        "ingredient_id": 2
      },
      {
        "ingredient_id": 4
      }
    ]
  },
  {
    "id": 2,
    "name": "Vaulatte",
    "teaser": "Nothing gives you a safe and secure feeling like a Vaulatte",
    "description": "",
    "price": 200,
    "image": "/vault.png",
    "ingredients": [
      {
        "ingredient_id": 1
      },
      {
        "ingredient_id": 2
      }
    ]
  },
  {
    "id": 3,
    "name": "Nomadicano",
    "teaser": "Drink one today and you will want to schedule another",
    "description": "",
    "price": 150,
    "image": "/nomad.png",
    "ingredients": [
      {
        "ingredient_id": 1
      },
      {
        "ingredient_id": 3
      }
    ]
  },
  {
    "id": 4,
    "name": "Terraspresso",
    "teaser": "Nothing kickstarts your day like a provision of Terraspresso",
    "description": "",
    "price": 150,
    "image": "terraform.png",
    "ingredients": [
      {
        "ingredient_id": 1
      }
    ]
  },
  {
    "id": 5,
    "name": "Vagrante espresso",
    "teaser": "Stdin is not a tty",
    "description": "",
    "price": 200,
    "image": "vagrant.png",
    "ingredients": [
      {
        "ingredient_id": 1
      }
    ]
  },
  {
    "id": 6,
    "name": "Connectaccino",
    "teaser": "Discover the wonders of our meshy service",
    "description": "",
    "price": 250,
    "image": "consul.png",
    "ingredients": [
      {
        "ingredient_id": 1
      },
      {
        "ingredient_id": 5
      }
    ]
  }
]
```


`hashicups/data_source_coffee.go` change as below
```go
package hashicups

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"time"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func dataSourceCoffees() *schema.Resource {
	return &schema.Resource{
		ReadContext: dataSourceCoffeesRead,
		Schema: map[string]*schema.Schema{
			"coffees": {
				Type:     schema.TypeList,
				Computed: true,
				Elem: &schema.Resource{
					Schema: map[string]*schema.Schema{
						"id": {
							Type:     schema.TypeInt,
							Computed: true,
						},
						"name": {
							Type:     schema.TypeString,
							Computed: true,
						},
						"teaser": {
							Type:     schema.TypeString,
							Computed: true,
						},
						"description": {
							Type:     schema.TypeString,
							Computed: true,
						},
						"price": {
							Type:     schema.TypeInt,
							Computed: true,
						},
						"image": {
							Type:     schema.TypeString,
							Computed: true,
						},
						"ingredients": {
							Type:     schema.TypeList,
							Computed: true,
							Elem: &schema.Resource{
								Schema: map[string]*schema.Schema{
									"ingredient_id": {
										Type:     schema.TypeInt,
										Computed: true,
									},
								},
							},
						},
					},
				},
			},
		},
	}
}

func dataSourceCoffeesRead(ctx context.Context, d *schema.ResourceData, m interface{}) diag.Diagnostics {
	client := &http.Client{Timeout: 10 * time.Second}

	// Warning or errors can be collected in a slice type
	var diags diag.Diagnostics

	req, err := http.NewRequest("GET", fmt.Sprintf("%s/coffees", "http://localhost:19090"), nil)
	if err != nil {
		return diag.FromErr(err)
	}

	r, err := client.Do(req)
	if err != nil {
		return diag.FromErr(err)
	}
	defer r.Body.Close()

	coffees := make([]map[string]interface{}, 0)
	err = json.NewDecoder(r.Body).Decode(&coffees)
	if err != nil {
		return diag.FromErr(err)
	}

	if err := d.Set("coffees", coffees); err != nil {
		return diag.FromErr(err)
	}

	// always run
	d.SetId(strconv.FormatInt(time.Now().Unix(), 10))

	return diags
}

```


`hashicups/provider.go`
```diff
-               ResourcesMap:   map[string]*schema.Resource{},
-               DataSourcesMap: map[string]*schema.Resource{},
+               ResourcesMap: map[string]*schema.Resource{},
+               DataSourcesMap: map[string]*schema.Resource{
+                       "hashicups_coffees": dataSourceCoffees(),
+               },
```

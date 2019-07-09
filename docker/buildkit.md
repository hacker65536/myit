# buildkit

https://github.com/moby/buildkit



require docker 

```console
$ docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a215d7133c34aa18e3b72b4a21fd0c6136
 Built:             Mon Mar  4 21:25:41 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a/18.06.1-ce
  Built:            Mon Mar  4 21:27:07 2019
  OS/Arch:          linux/amd64
  Experimental:     false
```

example
--


### install 
```console
$ git clone https://github.com/moby/buildkit.git 
$ cd buildkit
```
```console
$ make && sudo make install
---snip---
mkdir -p /usr/local/bin
install bin/* /usr/local/bin
```
```console
$ ls -la /usr/local/bin/bui*
-rwxr-xr-x 1 root root 23493281 Jul  9 07:33 /usr/local/bin/buildctl*
-rwxr-xr-x 1 root root 25994336 Jul  9 07:33 /usr/local/bin/buildkitd*
-rwxr-xr-x 1 root root  7636224 Jul  9 07:33 /usr/local/bin/buildkit-runc*
```

### runing containerized buildkit

```console
$ docker run --name buildkit -d --privileged -p 1234:1234 moby/buildkit:latest --addr tcp://0.0.0.0:1234
$ export BUILDKIT_HOST=tcp://0.0.0.0:1234
```

```console
$ buildctl build --help
NAME:
   buildctl build - build

USAGE:

  To build and push an image using Dockerfile:
    $ buildctl build --frontend dockerfile.v0 --opt target=foo --opt build-arg:foo=bar --local context=. --local dockerfile=. --output type=image,name=docker.io/username/image,push=true


OPTIONS:
   --output value, -o value  Define exports for build result, e.g. --output type=image,name=docker.io/username/image,push=true
   --progress value          Set type of progress (auto, plain, tty). Use plain to show container output (default: "auto")
   --trace value             Path to trace file. Defaults to no tracing.
   --local value             Allow build access to the local directory
   --frontend value          Define frontend used for build
   --opt value               Define custom options for frontend, e.g. --opt target=foo --opt build-arg:foo=bar
   --no-cache                Disable cache for all the vertices
   --export-cache value      Export build cache, e.g. --export-cache type=registry,ref=example.com/foo/bar, or --export-cache type=local,dest=path/to/dir
   --import-cache value      Import build cache, e.g. --import-cache type=registry,ref=example.com/foo/bar, or --import-cache type=local,src=path/to/dir
   --secret value            Secret value exposed to the build. Format id=secretname,src=filepath
   --allow value             Allow extra privileged entitlement, e.g. network.host, security.insecure
   --ssh value               Allow forwarding SSH agent to the builder. Format default|<id>[=<socket>|<key>[,<key>]]
```


```console
$ go run examples/buildkit0/buildkit.go | buildctl debug dump-llb | jq '.'
```

<details>
 <summary> json output </summary>
 
```json
{
  "Op": {
    "Op": {
      "Source": {
        "identifier": "docker-image://docker.io/library/alpine:latest"
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:665ba8b2cdc0cb0200e2a42a6b3c0f8f684089f4cd1b81494fbb9805879120f7",
  "OpMetadata": {
    "caps": {
      "source.image": true
    }
  }
}
{
  "Op": {
    "Op": {
      "Source": {
        "identifier": "docker-image://docker.io/library/golang:1.12-alpine"
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:fc8f7a5a931404bb996ee93e11e03292efdfdf9a150192d59616c38f4796d934",
  "OpMetadata": {
    "caps": {
      "source.image": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:fc8f7a5a931404bb996ee93e11e03292efdfdf9a150192d59616c38f4796d934",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "apk",
            "add",
            "--no-cache",
            "g++",
            "linux-headers"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:a46222437dd4c7aef26b33042c506f39c90472d7289c549f52c3f3b2f8aae351",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:a46222437dd4c7aef26b33042c506f39c90472d7289c549f52c3f3b2f8aae351",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "apk",
            "add",
            "--no-cache",
            "git",
            "libseccomp-dev",
            "make"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:7f62609774e367b0cc624dcab38ccb5bc55c15b27cf1f6e2bf194478fdbf9588",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:7f62609774e367b0cc624dcab38ccb5bc55c15b27cf1f6e2bf194478fdbf9588",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "git",
            "clone",
            "https://github.com/moby/buildkit.git",
            "/go/src/github.com/moby/buildkit"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:a7b6b3b8d3018e37d3102a74a87a75d9d38d0c477c925d92875cbc8f79993a77",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:a7b6b3b8d3018e37d3102a74a87a75d9d38d0c477c925d92875cbc8f79993a77",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "go",
            "build",
            "-o",
            "/bin/buildkitd",
            "./cmd/buildkitd"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/moby/buildkit"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:1d2287f20416f096572057758d88b6f3878755075de159930d9b4ed59570caeb",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:7f62609774e367b0cc624dcab38ccb5bc55c15b27cf1f6e2bf194478fdbf9588",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "apk",
            "add",
            "--no-cache",
            "btrfs-progs-dev"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:eb4974cbe7038a796ed1797a0ea535ab9eef78ec1e9099358047493bd33513a4",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:eb4974cbe7038a796ed1797a0ea535ab9eef78ec1e9099358047493bd33513a4",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "git",
            "clone",
            "https://github.com/containerd/containerd.git",
            "/go/src/github.com/containerd/containerd"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:4f68616b2ecf78173bf39e5d15aa9c62bb8af2f4649df80d0625b343af29157a",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:4f68616b2ecf78173bf39e5d15aa9c62bb8af2f4649df80d0625b343af29157a",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "git",
            "checkout",
            "-q",
            "v1.2.1"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/containerd/containerd"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:d4ba1d3026209dbdf2e62f642ea5bfd9e0d1afb8895df469e59c0140ab778ec0",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:d4ba1d3026209dbdf2e62f642ea5bfd9e0d1afb8895df469e59c0140ab778ec0",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "make",
            "bin/containerd"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/containerd/containerd"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:04a9aae2b762115f4ec8204e21689cd542c3b1d5e2f59c71f72a016f6fdc6f9a",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:7f62609774e367b0cc624dcab38ccb5bc55c15b27cf1f6e2bf194478fdbf9588",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "git",
            "clone",
            "https://github.com/opencontainers/runc.git",
            "/go/src/github.com/opencontainers/runc"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:22c09b6da3d3d54cad9104df8eda46e002cd910438b7a13e7a763ae98f8abe71",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:22c09b6da3d3d54cad9104df8eda46e002cd910438b7a13e7a763ae98f8abe71",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "git",
            "checkout",
            "-q",
            "v1.0.0-rc8"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/opencontainers/runc"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:4480690ca507d7d50ee7aceacd69aaa2e1a37eecd241fac3ade4dd511cde1221",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:4480690ca507d7d50ee7aceacd69aaa2e1a37eecd241fac3ade4dd511cde1221",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "go",
            "build",
            "-o",
            "/usr/bin/runc",
            "./"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/opencontainers/runc"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:15703be0e12f7ff521a2e2b27190a907a978c7782b2edaf65ccac30390345259",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:a7b6b3b8d3018e37d3102a74a87a75d9d38d0c477c925d92875cbc8f79993a77",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "go",
            "build",
            "-o",
            "/bin/buildctl",
            "./cmd/buildctl"
          ],
          "env": [
            "PATH=/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
            "GOPATH=/go"
          ],
          "cwd": "/go/src/github.com/moby/buildkit"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:06e161ac55cee0a4f3f38af176bb754c1c139d39c166399f7a514a262bb197c8",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:665ba8b2cdc0cb0200e2a42a6b3c0f8f684089f4cd1b81494fbb9805879120f7",
        "index": 0
      },
      {
        "digest": "sha256:06e161ac55cee0a4f3f38af176bb754c1c139d39c166399f7a514a262bb197c8",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "cp",
            "-a",
            "/src/bin/buildctl",
            "/dest/bin/"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          },
          {
            "input": 0,
            "dest": "/dest",
            "output": 1
          },
          {
            "input": 1,
            "dest": "/src",
            "output": 2
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:3f6611a49d8ac083bc452ecf6eda130cb5c7616c18ddfa66a725c899a94b56cc",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:665ba8b2cdc0cb0200e2a42a6b3c0f8f684089f4cd1b81494fbb9805879120f7",
        "index": 0
      },
      {
        "digest": "sha256:3f6611a49d8ac083bc452ecf6eda130cb5c7616c18ddfa66a725c899a94b56cc",
        "index": 1
      },
      {
        "digest": "sha256:15703be0e12f7ff521a2e2b27190a907a978c7782b2edaf65ccac30390345259",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "cp",
            "-a",
            "/src/usr/bin/runc",
            "/dest/bin/"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          },
          {
            "input": 1,
            "dest": "/dest",
            "output": 1
          },
          {
            "input": 2,
            "dest": "/src",
            "output": 2
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:6f4d26c026a2f8da2fe95d5f2de3a10f806154dfc11bf5c65dc8b087ae33bc0f",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:665ba8b2cdc0cb0200e2a42a6b3c0f8f684089f4cd1b81494fbb9805879120f7",
        "index": 0
      },
      {
        "digest": "sha256:6f4d26c026a2f8da2fe95d5f2de3a10f806154dfc11bf5c65dc8b087ae33bc0f",
        "index": 1
      },
      {
        "digest": "sha256:04a9aae2b762115f4ec8204e21689cd542c3b1d5e2f59c71f72a016f6fdc6f9a",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "cp",
            "-a",
            "/src/go/src/github.com/containerd/containerd/bin/containerd",
            "/dest/bin/"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          },
          {
            "input": 1,
            "dest": "/dest",
            "output": 1
          },
          {
            "input": 2,
            "dest": "/src",
            "output": 2
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:5b703cc21035cc62960fe225165db8ab878481e7072d41a2495c0e62f545d3e5",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:665ba8b2cdc0cb0200e2a42a6b3c0f8f684089f4cd1b81494fbb9805879120f7",
        "index": 0
      },
      {
        "digest": "sha256:5b703cc21035cc62960fe225165db8ab878481e7072d41a2495c0e62f545d3e5",
        "index": 1
      },
      {
        "digest": "sha256:1d2287f20416f096572057758d88b6f3878755075de159930d9b4ed59570caeb",
        "index": 0
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "cp",
            "-a",
            "/src/bin/buildkitd",
            "/dest/bin/"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          },
          {
            "input": 1,
            "dest": "/dest",
            "output": 1
          },
          {
            "input": 2,
            "dest": "/src",
            "output": 2
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:5329785843f6420a65ac8ba72383f62df450f22efcf5837bc97313378562abb5",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:5329785843f6420a65ac8ba72383f62df450f22efcf5837bc97313378562abb5",
        "index": 1
      }
    ],
    "Op": {
      "Exec": {
        "meta": {
          "args": [
            "ls",
            "-l",
            "/bin"
          ],
          "cwd": "/"
        },
        "mounts": [
          {
            "input": 0,
            "dest": "/",
            "output": 0
          }
        ]
      }
    },
    "platform": {
      "Architecture": "amd64",
      "OS": "linux"
    },
    "constraints": {}
  },
  "Digest": "sha256:745128e70d03da07efcec6c43001e0576ff17d61003be27c1de69d9cbea37b39",
  "OpMetadata": {
    "caps": {
      "exec.meta.base": true,
      "exec.mount.bind": true
    }
  }
}
{
  "Op": {
    "inputs": [
      {
        "digest": "sha256:745128e70d03da07efcec6c43001e0576ff17d61003be27c1de69d9cbea37b39",
        "index": 0
      }
    ],
    "Op": null
  },
  "Digest": "sha256:c011281ed823b4c28868cd85d97086b4ba8a159ccf54fb38cd7b87ef1f8768c1",
  "OpMetadata": {
    "caps": {
      "constraints": true,
      "platform": true
    }
  }
}
```
</details>


```console
$ go run examples/buildkit0/buildkit.go | buildctl build
[+] Building 108.1s (15/19)
 => => sha256:2d38965338529dc04aed99fbfbf548d181545c1ee2352b716e4ead932b3d11c9 301.71kB / 301.71kB                       0.5s
 => => sha256:7e39d5d392d49b0b7562bb66b8b539a73e8da6e8d59d88b9fcea7be5f1c48fd7 3.80kB / 3.80kB                           0.0s
 => => sha256:921b31ab772b38172fd9f942a40fae6db24decbd6706f67836260d47a72baab5 2.79MB / 2.79MB                           0.5s
 => => sha256:28c34ce20860db7ccc4b5329e6db12278b15269042d97d77ab3d8ebc0df71d0c 154B / 154B                               0.6s
 => => sha256:c9d9353edcedbd4b24bf97fe420aac3799604a6810556264be9710f312c7c9e6 125.32MB / 125.32MB                       1.8s
 => => unpacking docker.io/library/golang:1.12-alpine                                                                    5.1s
 => docker-image://docker.io/library/alpine:latest                                                                       0.7s
 => => resolve docker.io/library/alpine:latest                                                                           0.2s
 => => sha256:921b31ab772b38172fd9f942a40fae6db24decbd6706f67836260d47a72baab5 2.79MB / 2.79MB                           0.5s
 => => sha256:4d90542f0623c71f1f9c11be3da23167174ac9d93731cf91912922e916bab02c 1.51kB / 1.51kB                           0.0s
 => => sha256:ca1c944a4f8486a153024d9965aafbe24f5723c1d5c02f4964c045a16d19dc54 1.64kB / 1.64kB                           0.0s
 => => sha256:97a042bf09f1bf78c8cf3dcebef94614f2b95fa2f988a5c07314031bc2570c7a 528B / 528B                               0.0s
 => => unpacking docker.io/library/alpine:latest                                                                         0.1s
 => apk add --no-cache g++ linux-headers                                                                                 2.5s
 => apk add --no-cache git libseccomp-dev make                                                                           1.9s
 => apk add --no-cache btrfs-progs-dev                                                                                   1.9s
 => git clone https://github.com/moby/buildkit.git /go/src/github.com/moby/buildkit                                      7.1s
 => git clone https://github.com/opencontainers/runc.git /go/src/github.com/opencontainers/runc                          4.8s
 => git clone https://github.com/containerd/containerd.git /go/src/github.com/containerd/containerd                     17.9s
 => git checkout -q v1.0.0-rc8                                                                                           5.9s
 => go build -o /bin/buildctl ./cmd/buildctl                                                                            62.3s
 => go build -o /bin/buildkitd ./cmd/buildkitd                                                                          81.1s
 => go build -o /usr/bin/runc ./                                                                                        39.2s
 => git checkout -q v1.2.1                                                                                              18.0s
 => make bin/containerd                                                                                                 58.9s
 => => # 🇩 bin/containerd
 => cp -a /src/bin/buildctl /dest/bin/                                                                                   9.8s
 => cp -a /src/usr/bin/runc /dest/bin/              
 ```
 
 ```console
 $ go run examples/buildkit0/buildkit.go | buildctl build --output type=docker --exporter-opt name=buildkit0 | docker load
[+] Building 1.0s (20/20) FINISHED
 => docker-image://docker.io/library/alpine:latest                                                                       0.2s
 => => resolve docker.io/library/alpine:latest                                                                           0.2s
 => docker-image://docker.io/library/golang:1.12-alpine                                                                  0.4s
 => => resolve docker.io/library/golang:1.12-alpine                                                                      0.4s
 => CACHED apk add --no-cache g++ linux-headers                                                                          0.0s
 => CACHED apk add --no-cache git libseccomp-dev make                                                                    0.0s
 => CACHED git clone https://github.com/moby/buildkit.git /go/src/github.com/moby/buildkit                               0.0s
 => CACHED go build -o /bin/buildctl ./cmd/buildctl                                                                      0.0s
 => CACHED cp -a /src/bin/buildctl /dest/bin/                                                                            0.0s
 => CACHED git clone https://github.com/opencontainers/runc.git /go/src/github.com/opencontainers/runc                   0.0s
 => CACHED git checkout -q v1.0.0-rc8                                                                                    0.0s
 => CACHED go build -o /usr/bin/runc ./                                                                                  0.0s
 => CACHED cp -a /src/usr/bin/runc /dest/bin/                                                                            0.0s
 => CACHED apk add --no-cache btrfs-progs-dev                                                                            0.0s
 => CACHED git clone https://github.com/containerd/containerd.git /go/src/github.com/containerd/containerd               0.0s
 => CACHED git checkout -q v1.2.1                                                                                        0.0s
 => CACHED make bin/containerd                                                                                           0.0s
 => CACHED cp -a /src/go/src/github.com/containerd/containerd/bin/containerd /dest/bin/                                  0.0s
 => CACHED go build -o /bin/buildkitd ./cmd/buildkitd                                                                    0.0s
 => CACHED cp -a /src/bin/buildkitd /dest/bin/                                                                           0.0s
 => CACHED ls -l /bin                                                                                                    0.0s
 => exporting to oci image format                                                                                        0.6s
 => => exporting layers                                                                                                  0.0s
 => => exporting manifest sha256:f9350ebd540acf8b369b98ce461082fff2c38bd4aa4ab371be73250587a59272                        0.0s
 => => exporting config sha256:94104f920b097524c935f7943eb03de598e2e119f0d53ce4d22e4c07db30b050                          0.0s
 => => sending tarball                                                                                                   0.6s
Loaded image ID: sha256:94104f920b097524c935f7943eb03de598e2e119f0d53ce4d22e4c07db30b050
```

`WARN[0000] --exporter <exporter> is deprecated. Please use --output type=<exporter>[,<opt>=<optval>] instead.`

```console
$ docker image ls buildkit0 
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
buildkit0           latest              94104f920b09        6 minutes ago       127MB
```
ref
--

https://www.slideshare.net/AkihiroSuda/buildkit  
https://qiita.com/po3rin/items/deb798ed9c1edac5cc4b  

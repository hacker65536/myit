# project layout


https://github.com/golang-standards/project-layout


## go directories


### /cmd

main applications


### /internal

private application and library code.

### /pkg

library code that's ok to use by external applications (e.g., /pkg/mypubliclb).

### /vendor

Application dependencies.

### /api

openAPI/Swagger specs, JSON schema files, protocol definition files.

### /web

Web application specific components: static web assets, server side templates and SPAs.

### /configs
Configuration file tempates or default configs.

### /init

System init(systemd, upstart, sysv)

### scripts

Script to perform various build, install, analysis, ect ooperations.

### /build

Packaging and Continuous Integration.

### /deployments

IaaS, PaaS, system and continer orchestration deployment configurations and templates.

### /test


### /docs

desing doc

### /tools

Supporting tools for this project.

### /examples

### /third_party

### /githooks
git hooks

### /assets

Ohter assets to go along with your repository (images, logs, etc).

### /website

This is the place to put your project's website data if you are not using Github pages.

### /src


### Badges


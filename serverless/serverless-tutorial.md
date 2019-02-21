# serverless

https://github.com/serverless/serverless

## install

- require npm

```console
$ npm install -g serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/serverless -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/slss -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless
/home/ec2-user/.nvm/versions/node/v11.10.0/bin/sls -> /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/bin/serverless

> spawn-sync@1.0.15 postinstall /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/spawn-sync
> node postinstall


> serverless@1.38.0 postinstall /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless
> node ./scripts/postinstall.js


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
in /home/ec2-user/.bashrc


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
in /home/ec2-user/.bashrc


[tabtab] Adding source line to load /home/ec2-user/.nvm/versions/node/v11.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
in /home/ec2-user/.bashrc

+ serverless@1.38.0
added 386 packages from 261 contributors in 16.94s
```

```console
$ serverless --version
1.38.0
$ sls --version
1.38.0
$ slss --version
1.38.0
```

```console
$ serverless create --template aws-nodejs --path my-app
Serverless: Generating boilerplate...
Serverless: Generating boilerplate in "/home/ec2-user/my-app"
 _______                             __
|   _   .-----.----.--.--.-----.----|  .-----.-----.-----.
|   |___|  -__|   _|  |  |  -__|   _|  |  -__|__ --|__ --|
|____   |_____|__|  \___/|_____|__| |__|_____|_____|_____|
|   |   |             The Serverless Application Framework
|       |                           serverless.com, v1.38.0
 -------'

Serverless: Successfully generated boilerplate for template: "aws-nodejs"
```

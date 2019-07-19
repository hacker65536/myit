# cdk
https://github.com/aws/aws-cdk


require node


preinstall
--

install nvm
```console
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
```
```console
$ source ~/.bashrc
```
```console
$ nvm install --latest-npm --lts
```


install
--

install aws-cdk

```console
$ npm i -g aws-cdk
/home/ec2-user/.nvm/versions/node/v10.16.0/bin/cdk -> /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/aws-cdk/bin/cdk

> core-js@2.6.9 postinstall /home/ec2-user/.nvm/versions/node/v10.16.0/lib/node_modules/aws-cdk/node_modules/core-js
> node scripts/postinstall || echo "ignore"

Thank you for using core-js ( https://github.com/zloirock/core-js ) for polyfilling JavaScript standard library!

The project needs your help! Please consider supporting of core-js on Open Collective or Patreon:
> https://opencollective.com/core-js
> https://www.patreon.com/zloirock

Also, the author of core-js ( https://github.com/zloirock ) is looking for a good job -)

+ aws-cdk@1.0.0
added 243 packages from 246 contributors in 8.686s
```

```console
$ cdk --version
1.0.0 (build d89592e)
```

example
--

```console
$ cdk init sample-app --language=typescript
Applying project template sample-app for typescript
Initializing a new git repository...
Executing npm install...
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN cdk@0.1.0 No repository field.
npm WARN cdk@0.1.0 No license field.

# Useful commands

 * `npm run build`   compile typescript to js
 * `npm run watch`   watch for changes and compile
 * `cdk deploy`      deploy this stack to your default AWS account/region
 * `cdk diff`        compare deployed stack with current state
 * `cdk synth`       emits the synthesized CloudFormation template
```

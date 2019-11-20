# aws-amplify


https://aws-amplify.github.io/docs/js/start

```console
$ node -v
v12.12.0
```


## step1

```console
$ npx create-react-app myapp
$ cd myapp
```


```console
$ yarn start
```

```
Compiled successfully!

You can now view myapp in the browser.

  Local:            http://localhost:3000/
  On Your Network:  http://172.31.12.151:3000/

Note that the development build is not optimized.
To create a production build, use yarn build.
```


## step2

amplify init


- project name
- environment
- editor
  - Visual Studio Code
  - Atom Editor
  - Sublime Text
  - IntelliJ IDEA
  - Vim (via Terminal, Mac OS only)
  - Emacs (via Terminal, Mac OS only)
  - None
- app type
  - android
  - ios
  - javascript
- framework
  - angular
  - ember
  - ionic
  - react
  - react-native
  - vue
  - none
- src dir
- dist dir
- build cmd
- start cmd
- AWS profile

```
$ amplify init
Scanning for plugins...
Plugin scan successful
Note: It is recommended to run this command from the root of your app directory
? Enter a name for the project myapp
? Enter a name for the environment dev
? Choose your default editor: Visual Studio Code
? Choose the type of app that you're building javascript
Please tell us about your project
? What javascript framework are you using react
? Source Directory Path:  src
? Distribution Directory Path: build
? Build Command:  npm run-script build
? Start Command: npm run-script start
Using default provider  awscloudformation

For more information on AWS Profiles, see:
https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html

? Do you want to use an AWS profile? Yes
? Please choose the profile you want to use myprofile
⠦ Initializing project in the cloud...

CREATE_IN_PROGRESS DeploymentBucket        AWS::S3::Bucket            Wed Nov 20 2019 05:21:49 GMT+0                                               000 (Coordinated Universal Time) Resource creation Initiated
CREATE_IN_PROGRESS UnauthRole              AWS::IAM::Role             Wed Nov 20 2019 05:21:49 GMT+0                                               000 (Coordinated Universal Time) Resource creation Initiated
CREATE_IN_PROGRESS AuthRole                AWS::IAM::Role             Wed Nov 20 2019 05:21:49 GMT+0                                               000 (Coordinated Universal Time) Resource creation Initiated
CREATE_IN_PROGRESS UnauthRole              AWS::IAM::Role             Wed Nov 20 2019 05:21:49 GMT+0                                               000 (Coordinated Universal Time)
CREATE_IN_PROGRESS DeploymentBucket        AWS::S3::Bucket            Wed Nov 20 2019 05:21:49 GMT+0                                               000 (Coordinated Universal Time)
CREATE_IN_PROGRESS AuthRole                AWS::IAM::Role             Wed Nov 20 2019 05:21:48 GMT+0                                               000 (Coordinated Universal Time)
CREATE_IN_PROGRESS amplify-myapp-dev-52145 AWS::CloudFormation::Stack Wed Nov 20 2019 05:21:45 GMT+0                                               000 (Coordinated Universal Time) User Initiated
⠸ Initializing project in the cloud...

CREATE_COMPLETE UnauthRole AWS::IAM::Role Wed Nov 20 2019 05:22:02 GMT+0000 (Coordinated Universal Time)
CREATE_COMPLETE AuthRole   AWS::IAM::Role Wed Nov 20 2019 05:22:02 GMT+0000 (Coordinated Universal Time)
⠇ Initializing project in the cloud...

CREATE_COMPLETE amplify-myapp-dev-52145 AWS::CloudFormation::Stack Wed Nov 20 2019 05:22:13 GMT+0000 (Coordinated Universal Time)
CREATE_COMPLETE DeploymentBucket        AWS::S3::Bucket            Wed Nov 20 2019 05:22:10 GMT+0000 (Coordinated Universal Time)
✔ Successfully created initial AWS cloud resources for deployments.
✔ Initialized provider successfully.
Initialized your environment successfully.

Your project has been successfully initialized and connected to the cloud!

Some next steps:
"amplify status" will show you what you've added already and if it's locally configured or deployed
"amplify <category> add" will allow you to add features like user login or a backend API
"amplify push" will build all your local backend resources and provision it in the cloud
"amplify publish" will build all your local backend and frontend resources (if you have hosting category added) and provision it in the cloud

Pro tip:
Try "amplify add api" to create a backend API and then "amplify publish" to deploy everything
```


```
aws ec2 create-launch-template  --launch-template-name launchtemplatename --launch-template-data file://launch_template.json
```

update
```
aws ec2 create-launch-template-version --launch-template-name launchtemplatename --launch-template-data file://launch_template.json
```

set default
```
aws ec2 modify-launch-template --launch-template-name launchtemplatename --default-version 2
```

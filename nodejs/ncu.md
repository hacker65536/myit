# npm-check-updates



```console
$ npm list --depth=0
cdk@0.1.0 /home/ec2-user/cdk
├── @aws-cdk/assert@1.63.0
├── @aws-cdk/aws-autoscaling@1.63.0
├── @aws-cdk/aws-ec2@1.63.0
├── @aws-cdk/aws-elasticloadbalancingv2@1.63.0
├── @aws-cdk/core@1.63.0
├── @types/jest@26.0.13
├── @types/node@10.17.27
├── aws-cdk@1.63.0
├── jest@26.4.2
├── source-map-support@0.5.19
├── ts-jest@26.3.0
├── ts-node@8.10.2
└── typescript@3.9.7
```
```console
$ npm outdated

Package                               Current    Wanted   Latest  Location
@aws-cdk/assert                        1.63.0    1.63.0   1.70.0  cdk
@aws-cdk/aws-autoscaling               1.63.0    1.70.0   1.70.0  cdk
@aws-cdk/aws-ec2                       1.63.0    1.70.0   1.70.0  cdk
@aws-cdk/aws-elasticloadbalancingv2    1.63.0    1.70.0   1.70.0  cdk
@aws-cdk/core                          1.63.0    1.63.0   1.70.0  cdk
@types/jest                           26.0.13   26.0.15  26.0.15  cdk
@types/node                          10.17.27  10.17.27  14.14.5  cdk
aws-cdk                                1.63.0    1.63.0   1.70.0  cdk
jest                                   26.4.2    26.6.1   26.6.1  cdk
ts-jest                                26.3.0    26.4.3   26.4.3  cdk
ts-node                                8.10.2    8.10.2    9.0.0  cdk
typescript                              3.9.7     3.9.7    4.0.5  cdk
```

```console
$ npm install -g npm-check-updates
```


```console
$ ncu
Checking /home/ec2-user/cdk/package.json
[====================] 13/13 100%

 @aws-cdk/aws-autoscaling              ^1.63.0  →   ^1.70.0
 @aws-cdk/aws-ec2                      ^1.63.0  →   ^1.70.0
 @aws-cdk/aws-elasticloadbalancingv2   ^1.63.0  →   ^1.70.0
 @aws-cdk/core                          1.63.0  →    1.70.0
 source-map-support                    ^0.5.16  →   ^0.5.19
 @aws-cdk/assert                        1.63.0  →    1.70.0
 @types/jest                          ^26.0.10  →  ^26.0.15
 @types/node                          10.17.27  →   14.14.5
 jest                                  ^26.4.2  →   ^26.6.1
 ts-jest                               ^26.2.0  →   ^26.4.3
 aws-cdk                                1.63.0  →    1.70.0
 ts-node                                ^8.1.0  →    ^9.0.0
 typescript                             ~3.9.7  →    ~4.0.5

Run ncu -u to upgrade package.json
```

```console
$ ncu -u
Upgrading /home/ec2-user/cdk/package.json
[====================] 13/13 100%

 @aws-cdk/aws-autoscaling              ^1.63.0  →   ^1.70.0
 @aws-cdk/aws-ec2                      ^1.63.0  →   ^1.70.0
 @aws-cdk/aws-elasticloadbalancingv2   ^1.63.0  →   ^1.70.0
 @aws-cdk/core                          1.63.0  →    1.70.0
 source-map-support                    ^0.5.16  →   ^0.5.19
 @aws-cdk/assert                        1.63.0  →    1.70.0
 @types/jest                          ^26.0.10  →  ^26.0.15
 @types/node                          10.17.27  →   14.14.5
 jest                                  ^26.4.2  →   ^26.6.1
 ts-jest                               ^26.2.0  →   ^26.4.3
 aws-cdk                                1.63.0  →    1.70.0
 ts-node                                ^8.1.0  →    ^9.0.0
 typescript                             ~3.9.7  →    ~4.0.5

Run npm install to install new versions.
```

```console
npm i
```

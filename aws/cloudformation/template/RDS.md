Parameter  
```json
"Parameters": {
        "DBName": {
            "Default": "dbname",
            "Description": "dbname",
            "Type": "String"
        },
        "DBBackupRetentionPeriod": {
            "Default": "3",
            "Description": "db backup retention period",
            "Type": "String"
        },
        "DBBackupWindow": {
            "Default": "19:00-20:00",
            "Description": "dbbackupwindow jst 4:00-5:00-> utc 19:00-20:00",
            "Type": "String"
        },
        "DBId": {
            "Default": "dbid",
            "Description": "DBInstanceIdentifier",
            "Type": "String"
        },
        "DBInstanceClass": {
            "AllowedValues": [
                "db.t1.micro",
                "db.t2.micro",
                "db.t2.small",
                "db.t2.medium",
                "db.m1.small",
                "db.m1.medium",
                "db.m1.large",
                "db.m1.xlarge",
                "db.m2.xlarge",
                "db.m2.2xlarge",
                "db.cr1.8xlarge",
                "db.m2.4xlarge",
                "db.m3.medium",
                "db.m3.large",
                "db.m3.xlarge",
                "db.m3.2xlarge",
                "db.r3.large",
                "db.r3.xlarge"
            ],
            "ConstraintDescription": "must be a valid RDS instance class.",
            "Default": "db.t2.micro",
            "Description": "RDS Instance class",
            "Type": "String"
        },
        "DBMaintenanceWindow": {
            "Default": "sun:20:05-sun:21:05",
            "Description": "maintenaceWindow time RDS,REDIS jst mon:05:05-06:05 -> utc sun:20:05-sun:21:05",
            "Type": "String"
        },
        "DBPass": {
            "Default": "W5jple2Q",
            "Description": "dbpass",
            "Type": "String"
        },
        "DBSize": {
            "Default": "10",
            "Description": "GB",
            "Type": "String"
        },
        "DBUser": {
            "Default": "dbuser",
            "Description": "dbuser",
            "Type": "String"
        },


}
```

SG  
```json
        "SGMysql": {
            "Properties": {
                "GroupDescription": "SG for mysql",
                "SecurityGroupIngress": [
                    {
                        "CidrIp": {
                            "Fn::Join": [
                                "",
                                [
                                    {
                                        "Ref": "VPCCidr"
                                    },
                                    ".0.0/16"
                                ]
                            ]
                        },
                        "FromPort": "3306",
                        "IpProtocol": "tcp",
                        "ToPort": "3306"
                    }
                ],
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": {
                            "Fn::Join": [
                                "-",
                                [
                                    {
                                        "Ref": "AWS::StackName"
                                    },
                                    "SGMysql"
                                ]
                            ]
                        }
                    }
                ],
                "VpcId": {
                    "Ref": "VPC"
                }
            },
            "Type": "AWS::EC2::SecurityGroup"
        },
```
DBParameter  
```json
       "DBParameterGroup": {
            "Properties": {
                "Description": "mycnf_utf8", 
                "Family": "MySQL5.6", 
                "Parameters": {
                    "character_set_client": "utf8", 
                    "character_set_connection": "utf8", 
                    "character_set_database": "utf8", 
                    "character_set_results": "utf8", 
                    "character_set_server": "utf8", 
                    "collation_connection": "utf8_general_ci", 
                    "collation_server": "utf8_general_ci"
                }, 
                "Tags": [
                    {
                        "Key": "Env", 
                        "Value": {
                            "Ref": "Tag"
                        }
                    }, 
                    {
                        "Key": "Name", 
                        "Value": "mycnf_utf8"
                    }
                ]
            }, 
            "Type": "AWS::RDS::DBParameterGroup"
        }, 
```
DBSubnetGroup  
```json
        "DBSubnetGroup": {
            "Properties": {
                "DBSubnetGroupDescription": {
                    "Fn::Join": [
                        "-",
                        [
                            {
                                "Ref": "AWS::StackName"
                            },
                            "DBSubnetGroup"
                        ]
                    ]
                },
                "SubnetIds": [
                    {
                        "Ref": "Subnet0"
                    },
                    {
                        "Ref": "Subnet1"
                    }
                ],
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": {
                            "Fn::Join": [
                                "-",
                                [
                                    {
                                        "Ref": "AWS::StackName"
                                    },
                                    "DBSubnetGroup"
                                ]
                            ]
                        }
                    }
                ]
            },
            "Type": "AWS::RDS::DBSubnetGroup"
        },
```

DBinstance  
```json
"RDSInstanceName":{
   "Type" : "AWS::RDS::DBInstance",
   "Properties" :
   {
      "AllocatedStorage" : {"Ref":"DBSize"},
      "AllowMajorVersionUpgrade" : true,
      "AutoMinorVersionUpgrade" : true,
      "BackupRetentionPeriod" : {"Ref":"DBBackupRetentionPeriod"},
      "DBInstanceClass" : {"Ref":"DBInstanceClass"},
      "DBInstanceIdentifier" : {"Ref":"DBId"},
      "DBName" : {"Ref":"DBName"},
      "DBParameterGroupName" : {"Ref":"DBParameterGroup"},
      "DBSubnetGroupName" : {"Ref":"DBId"},
      "Engine" : "MySQL",
      "MasterUsername" : {"Ref":"DBUser"},
      "MasterUserPassword" : {"Ref":"DBPass"},
      "MultiAZ" : false,
      "PreferredBackupWindow" : {"Ref": "DBBackupWindow"},
      "PreferredMaintenanceWindow" : { "Ref": "DBMaintenanceWindow"},
      "Tags" : [ 
         {
            "Key": "Name",
               "Value": {
                "Fn::Join": [
                   "-",                          [
                   {
                     "Ref": "AWS::StackName"
                    },
                    "rds"
                   ]
               ]
            }
          }
      ],
      "VPCSecurityGroups" : [ { "Ref": "SGMysql"}]
   }
} 
```

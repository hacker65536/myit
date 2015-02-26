
```json
"Parameters": {
        "DBUser": {
            "Default": "dbuser", 
            "Description": "dbuser", 
            "Type": "String"
        },
        "DBAName": {
            "Default": "dbname", 
            "Description": "dbname", 
            "Type": "String"
        }, 
        "DBPass": {
            "Default": "dbpass", 
            "Description": "dbpass", 
            "Type": "String"
        }, 
        "DBid": {
            "Default": "dbid", 
            "Description": "DBInstanceIdentifier", 
            "Type": "String"
        }, 
        "DBBackupWindow": {
            "Default": "19:00-20:00", 
            "Description": "dbbackupwindow jst 4:00-5:00-> utc 19:00-20:00", 
            "Type": "String"
        }, 
        "DBBackupRetentionPeriod": {
            "Default": "3", 
            "Description": "db backup retention period", 
            "Type": "String"
        }, 
        "DBMaintenanceWindow": {
            "Default": "sun:20:05-sun:21:05", 
            "Description": "maintenaceWindow time RDS,REDIS jst mon:05:05-06:05 -> utc sun:20:05-sun:21:05", 
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
                        "Key": "Env", 
                        "Value": {
                            "Ref": "Tag"
                        }
                    }, 
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

DBinstance  
```json
"RDSInstanceName":{
   "Type" : "AWS::RDS::DBInstance",
   "Properties" :
   {
      "AllocatedStorage" : "10",
      "AllowMajorVersionUpgrade" : true,
      "AutoMinorVersionUpgrade" : true,
      "BackupRetentionPeriod" : {"Ref":"DBBackupRetentionPeriod"},
      "DBInstanceClass" : {"Ref":"DBInstanceClass"},
      "DBInstanceIdentifier" : {"Ref":"DBId"},
      "DBName" : {"Ref":"DBName"},
      "DBParameterGroupName" : {"Ref":"DBParameterGroupName"},
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

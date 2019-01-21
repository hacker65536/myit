https://hackernoon.com/aws-cloudwatch-monitoring-with-grafana-ace63e1ab507

prepare
----------
- Data Sources Type CloudWatch
- create dashboard
- dashboard settings 
- create variables



region
--------
- General Name = Region
- Query Options Data source = CloudWatch
- Query Options Query = regions()

db
-------
- General Name = Db
- Query Options Data source = CloudWatch
- Query Options Query = dimension_values($Region,AWS/RDS,CPUUtilization,DBInstanceIdentifier)

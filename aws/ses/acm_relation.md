1. Verify a New Domain
2. Use Route 53
3. Wait a moment for verification
4. Check route53 recourd set of Type TXT
5. Create a Rule Set
6. Add Recipient ,input domainname
7. Add action S3  (s3 bucket = xxx ,key prefix = xxx, sns topic = none
8. Add action stop rule set (sns topic = none)




userdata
--

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html

>User data must be base64-encoded. The Amazon EC2 console can perform the base64 encoding for you or accept base64-encoded input.

>User data is limited to 16 KB, in raw form, before it is base64-encoded. The size of a string of length n after base64-encoding is ceil(n/3)*4.

>User data must be base64-decoded when you retrieve it. The data is decoded for you automatically if you retrieve it using instance metadata or the console.

>User data is treated as opaque data: what you give is what you get back. It is up to the instance to be able to interpret it.

>If you stop an instance, modify its user data, and start the instance, the updated user data is not executed when you start the instance.

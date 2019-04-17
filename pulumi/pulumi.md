# pulumi

install
--
https://pulumi.io/quickstart/install.html

```console
$ curl -fsSL https://get.pulumi.com | sh
=== Installing Pulumi v0.17.5 ===
+ Downloading https://get.pulumi.com/releases/sdk/pulumi-v0.17.5-linux-x64.tar.gz...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 37.3M  100 37.3M    0     0  24.3M      0  0:00:01  0:00:01 --:--:-- 24.3M
+ Extracting to /home/ec2-user/.pulumi/bin
+ Adding $HOME/.pulumi/bin to $PATH in /home/ec2-user/.bashrc

=== Pulumi is now installed! 🍹 ===
+ Please restart your shell or add add /home/ec2-user/.pulumi/bin to your $PATH
+ If you're new to Pulumi, here are some resources for getting started:
      - Getting Started Guide: https://pulumi.io/quickstart
      - Examples Repo: https://github.com/pulumi/examples
      - Create a New Project: Run 'pulumi new' to create a new project using a template

```


```console
$ ls -la ~/.pulumi/bin
total 98228
drwx------ 2 ec2-user ec2-user      178 Apr 17 01:38 .
drwxrwxr-x 3 ec2-user ec2-user       17 Apr 17 01:38 ..
-rwxrwxr-x 1 ec2-user ec2-user 42059034 Apr 17 01:38 pulumi
-rwxrwxr-x 1 ec2-user ec2-user 19479951 Apr 17 01:38 pulumi-language-go
-rwxrwxr-x 1 ec2-user ec2-user 19555218 Apr 17 01:38 pulumi-language-nodejs
-rwxrwxr-x 1 ec2-user ec2-user 19470246 Apr 17 01:38 pulumi-language-python
-rw-rw-r-- 1 ec2-user ec2-user     4734 Apr 17 01:38 pulumi-language-python-exec
-rwxrwxr-x 1 ec2-user ec2-user      238 Apr 17 01:38 pulumi-resource-pulumi-nodejs
```

```console
$ cat ~/.bashrc|tail -1
export PATH=$PATH:$HOME/.pulumi/bin
```
```console
$ source ~/.bashrc
```
```console
$ pulumi version
v0.17.5
```

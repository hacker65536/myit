
```console
$ mkdir csharp
$ cd !$
```
```console
$ docker pull microsoft/dotnet
Using default tag: latest
latest: Pulling from microsoft/dotnet
05d1a5232b46: Pull complete
5cee356eda6b: Pull complete
89d3385f0fd3: Pull complete
80ae6b477848: Pull complete
5a72be4492c3: Pull complete
6357eefc36f5: Pull complete
4c8f38b049c9: Pull complete
Digest: sha256:c50b596c93b11167ef7c6174a2717a18382d28965c11984691a0479c990ada3d
Status: Downloaded newer image for microsoft/dotnet:latest
```

```console
$ mkdir myApp
```
```console
$ docker run --rm -v $(pwd)/myApp:/myApp  microsoft/dotnet dotnet new console -o myApp
Getting ready...
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on myApp/myApp.csproj...
  Restoring packages for /myApp/myApp.csproj...
  Generating MSBuild file /myApp/obj/myApp.csproj.nuget.g.props.
  Generating MSBuild file /myApp/obj/myApp.csproj.nuget.g.targets.
  Restore completed in 133.02 ms for /myApp/myApp.csproj.

Restore succeeded.
```
```console
$ docker run --rm -v $(pwd)/myApp:/myApp -w /myApp microsoft/dotnet dotnet run
Hello World!
```
```console
$ ls -la myApp/
total 8
drwxrwxr-x 4 ec2-user ec2-user  66 Sep 21 12:08 .
drwxrwxr-x 3 ec2-user ec2-user  19 Sep 21 12:06 ..
drwxr-xr-x 3 root     root      19 Sep 21 12:08 bin
-rw-r--r-- 1 root     root     178 Sep 21 12:06 myApp.csproj
drwxr-xr-x 3 root     root     148 Sep 21 12:08 obj
-rw-r--r-- 1 root     root     187 Sep 21 12:06 Program.cs
```
```console
$ cat myApp/Program.cs
using System;

namespace myApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```
```console
$ docker run --rm microsoft/dotnet dotnet --info
.NET Core SDK (reflecting any global.json):
 Version:   2.1.402
 Commit:    3599f217f4

Runtime Environment:
 OS Name:     debian
 OS Version:  9
 OS Platform: Linux
 RID:         debian.9-x64
 Base Path:   /usr/share/dotnet/sdk/2.1.402/

Host (useful for support):
  Version: 2.1.4
  Commit:  85255dde3e

.NET Core SDKs installed:
  2.1.402 [/usr/share/dotnet/sdk]

.NET Core runtimes installed:
  Microsoft.AspNetCore.All 2.1.4 [/usr/share/dotnet/shared/Microsoft.AspNetCore.All]
  Microsoft.AspNetCore.App 2.1.4 [/usr/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 2.1.4 [/usr/share/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET Core runtimes or SDKs:
  https://aka.ms/dotnet-download
```

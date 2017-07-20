
https://docs.docker.com/get-started/part4/

1. Launch Hyper-V Manager
2. Click `Virtual Switch Manager` 
3. Click `Create Virtual Switch` of type `External`
4. Give it the name `myswitch`, and check the box to share your host machine's active network adapter

![virtual switch](/images/hyperv-vswitch.png)



```
C:\Users\USER>docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1
Running pre-create checks...
Creating machine...
(myvm1) Copying C:\Users\USER\.docker\machine\cache\boot2docker.iso to C:\Users\USER\.docker\machine\machines\myvm1\boot2docker.iso...
(myvm1) Creating SSH key...
(myvm1) Creating VM...
(myvm1) Using switch "myswitch"
(myvm1) Creating VHD
(myvm1) Starting VM...
(myvm1) Waiting for host to start...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...

This machine has been allocated an IP address, but Docker Machine could not
reach it successfully.

SSH for the machine should still work, but connecting to exposed ports, such as
the Docker daemon port (usually <ip>:2376), may not work properly.

You may need to add the route manually, or use another related workaround.

This could be due to a VPN, proxy, or host file configuration issue.

You also might want to clear any VirtualBox host only interfaces you are not using.
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env myvm1
```

one more type myvm2
```
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm2
```

![hyper-v virtual machine](/images/hyperv-v-vm.png)




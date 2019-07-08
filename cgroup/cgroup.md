# CGROUP

https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt

A **cgroup** associates a set of tasks with a set of paramters ofr one or more subsystems.

A **subsystem** is a module that makes use of the task grouping facilities provided by cgroups to treat groups of tasks in particular way. 
A subsystem is typically a "resource controller" that a schedules a resource or applies per-cgroup limits, 
but it may be anything that wants to act on a group of processes, e.g. a virtualization subsystem.

A **hierarchy** is a set of cgroups arranged in a tree, such that every task in the system is in exactly one of the cgroups in the hierarchy, 
and a set of subsystems; each subsystem has system-specific state attached to each cgroup in the hierarchy. 
Each hierarchy has an instance of the cgroup virtual filesystem associated with it.

At any one time there may be multiple active hierarchies of task cgroups. 
Each hierarchy is a partition of all tasks in the system.

User-leve code may create and destroy cgroups bye name in an instance of the cgroup virtuual file system, 
specify and query to which cgroup a task is assigned, and list the task PIDs assigned to a cgroup.
Those creations and assignments only affect the hierarchy associated with taht instance of the cgroup file system.

On their own, the only use for cgroups is for simple job tracking. 
The intention is that other subsystems hook into the generic cgroup support to provide new attributes for cgroups, 
such as accounting/limiting the resources which processes in a cgroup can access. 
For example, cpusets (see Documentation/cgoupr-v1/cpusets.txt) allow you to associate a set of CPUs and a set of memory nodes with the tasks in each cgroup.

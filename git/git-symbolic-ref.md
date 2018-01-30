
`git symbolic-ref --help`
```
DESCRIPTION
       Given one argument, reads which branch head the given symbolic ref refers to and outputs
       its path, relative to the .git/ directory. Typically you would give HEAD as the <name>
       argument to see which branch your working tree is on.

       Given two arguments, creates or updates a symbolic ref <name> to point at the given branch
       <ref>.

       Given --delete and an additional argument, deletes the given symbolic ref.

       A symbolic ref is a regular file that stores a string that begins with ref: refs/. For
       example, your .git/HEAD is a regular file whose contents is ref: refs/heads/master.
```

```
$ cat .git/HEAD
ref: refs/heads/master

$ git symbolic-ref HEAD
refs/heads/master

$ git symbolic-ref HEAD --short
master
```

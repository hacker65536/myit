
```
$ git clone git@github.com:hacker65536/submodule.git
Cloning into 'submodule'...
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
Checking connectivity... done.

$ cd !$:t:r

git submodule add git@github.com:hacker65536/submodule1.git
Cloning into 'submodule1'...
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
Checking connectivity... done.


$ ls -la
total 24
drwxrwxr-x  4 ec2-user ec2-user 4096 Aug 22 07:22 .
drwx------ 72 ec2-user ec2-user 4096 Aug 22 07:21 ..
drwxrwxr-x  9 ec2-user ec2-user 4096 Aug 22 07:22 .git
-rw-rw-r--  1 ec2-user ec2-user   95 Aug 22 07:22 .gitmodules
-rw-rw-r--  1 ec2-user ec2-user   11 Aug 22 07:21 README.md
drwxrwxr-x  2 ec2-user ec2-user 4096 Aug 22 07:22 submodule1

$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   .gitmodules
        new file:   submodule1


$ git diff --cached
diff --git a/.gitmodules b/.gitmodules
new file mode 100644
index 0000000..e5d3d1f
--- /dev/null
+++ b/.gitmodules
@@ -0,0 +1,3 @@
+[submodule "submodule1"]
+       path = submodule1
+       url = git@github.com:hacker65536/submodule1.git
diff --git a/submodule1 b/submodule1
new file mode 160000
index 0000000..3aca4c2
--- /dev/null
+++ b/submodule1
@@ -0,0 +1 @@
+Subproject commit 3aca4c2f84399ea62a8af641b0a0e7de81f2aa1e


$ git commit -m "Add submodule"
[master 374dc2b] Add submodule
 2 files changed, 4 insertions(+)
 create mode 100644 .gitmodules
 create mode 160000 submodule1


$ cd submodule1/
$ git show
commit 3aca4c2f84399ea62a8af641b0a0e7de81f2aa1e
Author: shacker <s.hacker65536@gmail.com>
Date:   Tue Aug 22 16:20:57 2017 +0900

    Initial commit

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..3b85381
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+# submodule1
\ No newline at end of file



$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master

$ git fetch
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From github.com:hacker65536/submodule1
 * [new branch]      hacker65536-patch-1 -> origin/hacker65536-patch-1

$ git branch -a
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/hacker65536-patch-1
  remotes/origin/master

$ git checkout hacker65536-patch-1
Branch hacker65536-patch-1 set up to track remote branch hacker65536-patch-1 from origin.
Switched to a new branch 'hacker65536-patch-1'


$ cd ..
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   submodule1 (new commits)

no changes added to commit (use "git add" and/or "git commit -a")

$ git add .
$ git commit -m "update submodule"
[master ac0c5bf] update submodule
 1 file changed, 1 insertion(+), 1 deletion(-)
 
$ git push
Counting objects: 5, done.
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 578 bytes | 0 bytes/s, done.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To git@github.com:hacker65536/submodule.git
   67be384..ac0c5bf  master -> master

```


1. `git submodule add https://github.com/aaaa/bbbb.git`
2. `git submodule init bbbb`
3. `git submoduel update`
4. `cd bbbb`
6. `git checkout -b fixbranch`
7. `touch file`
8. `git add .`
9. `git commit -m"fix"`
10. `git checkout master`
11. `git pull`
12. `git merge fixbranch`
13. `git push`
14. `git branch -d fixbranch`
15. `cd ..`
16. `git add bbbb`
17. `git commit -m "update bbbb"`
18. `git push`



other 

1. `git submodule init bbbb`
2. `git pull`
3. `git submodule udpate`



サブモジュールに入ってmodify -> commit を行った後は`git push origin HEAD:<BRANCH>`を行う  
サブモジュールの中ではcommit idに対してdetatchしているので、HEADの移動はしない  
ブランチではなくCOMMIT IDだから



open windows explorer from WSL shell
--

```console
ubuntu@hostname:~$ explorer.exe $(wslpath -w /mnt/c/Users/<USERNAME>/AppData/Local/Packages/CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc/LocalState/)
```

https://superuser.com/questions/1338991/how-to-open-windows-explorer-from-current-working-directory-of-wsl-shell

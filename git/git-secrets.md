
https://github.com/awslabs/git-secrets

install
---------
```console
$ git clone https://github.com/awslabs/git-secrets.git
$ cd !$:t:r
```

```console
$ make test
test/bats/bin/bats test/
 ✓ Rejects commit messages with prohibited patterns
 ✓ Allows commit messages that do not match a prohibited pattern
 ✓ no arguments prints usage instructions
 ✓ -h prints help
 ✓ Invalid scan filename fails
 ✓ Does not require secrets
 ✓ No prohibited matches exits 0
 ✓ Scans all files when no file provided
 ✓ Scans all files including history
 ✓ Scans all files when no file provided with secret in history
 ✓ Scans all files including history with secret in history
 ✓ Scans history with secrets distributed among branches in history
 ✓ Scans recursively
 ✓ Scans recursively only if -r is given
 ✓ Excludes allowed patterns from failures
 ✓ Prohibited matches exits 1
 ✓ Only matches on word boundaries
 ✓ Can scan from stdin using -
 ✓ installs hooks for repo
 ✓ fails if hook exists and no -f
 ✓ Overwrites hooks if -f is given
 ✓ installs hooks for repo with Debian style directories
 ✓ installs hooks to template directory
 ✓ Scans using keys from credentials file
 ✓ Lists secrets for a repo
 ✓ Adds secrets to a repo and de-dedupes
 ✓ Adds allowed patterns to a repo and de-dedupes
 ✓ Empty lines must be ignored in .gitallowed files
 ✓ Comment lines must be ignored in .gitallowed files
 ✓ Scans all files and allowing none of the bad patterns in .gitallowed
 ✓ Scans all files and allowing all bad patterns in .gitallowed
 ✓ Adds common AWS patterns
 ✓ Adds providers
 ✓ Strips providers that return nothing
 ✓ --recursive cannot be used with SCAN_*
 ✓ --recursive can be used with --scan
 ✓ --recursive can't be used with --list
 ✓ -f can only be used with --install
 ✓ -a can only be used with --add
 ✓ -l can only be used with --add
 ✓ --cached can only be used with --scan
 ✓ --no-index can only be used with --scan
 ✓ --untracked can only be used with --scan
 ✓ Rejects commits with prohibited patterns in changeset
 ✓ Rejects commits with prohibited patterns in changeset with filename that contain spaces
 ✓ Scans staged files
 ✓ Allows commits that do not match prohibited patterns
 ✓ Rejects commits with prohibited patterns in changeset when AWS provider is enabled
 ✓ Rejects merges with prohibited patterns in history
 ✓ Allows merges that do not match prohibited patterns

50 tests, 0 failures
```

```console
$ sudo make install
```


example
-----------
```
$ mkdir secrets-scan-test
$ cd !$
```

```
$ git init
Initialized empty Git repository in /home/ec2-user/secrets-scan-test/.git/
```
```
$ git secrets --install
✓ Installed commit-msg hook to .git/hooks/commit-msg
✓ Installed pre-commit hook to .git/hooks/pre-commit
✓ Installed prepare-commit-msg hook to .git/hooks/prepare-commit-msg
```
```
$ git secrets --register-aws
OK
```

```
$ echo "AKIAXXXXXXXXXXXXXXXX">secret
$ git add secret
$ git commit -a -m"init"
secret:1:AKIAXXXXXXXXXXXXXXXX

[ERROR] Matched one or more prohibited patterns

Possible mitigations:
- Mark false positives as allowed using: git config --add secrets.allowed ...
- Mark false positives as allowed by adding regular expressions to .gitallowed at repository's root directory
- List your configured patterns: git config --get-all secrets.patterns
- List your configured allowed patterns: git config --get-all secrets.allowed
- List your configured allowed patterns in .gitallowed at repository's root directory
- Use --no-verify if this is a one-time false positive
```

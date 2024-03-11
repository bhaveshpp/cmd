# Git

## Delete commit

```bash
git reset --hard <sha1-commit-id>
```
or
```
git reset --hard HEAD~1
```
then
```
git push origin HEAD --force
```

## Moved my changes to a new repository with its history.

```
git clone git@bitbucket.org:username/test.git

git remote add old git@bitbucket.org:namespace/projectx.git

git fetch https://username@bitbucket.org/namespace/projectx.git PROX-719-adjust-barcode-status-with-magestore-adjuststock 
 
git cherry-pick <commit id 1>

git cherry-pick <commit id 2>

git cherry-pick <commit id 3>

git cherry-pick <commit id 4>

This way I have moved my changes to a new repository with its history.
Ex:
git fetch https://username@bitbucket.org/namespace/projectx.git PROX-719-adjust-barcode-status-with-magestore-adjuststock && git cherry-pick c9df3a086868ff4417e36651ad590eeaf3d6e462
```

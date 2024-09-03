# Git

## Rallback file changes.

```bash
git checkout HEAD -- composer.json

```

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

## Moving a sub-directory to a new repo with history

```
git clone git@bitbucket.org:seepossible/projectx.git
git remote rm origin
git filter-branch --subdirectory-filter app/code/SeePossible/MTPdfUrdTransaction -- --all
mv * ~/Documents/seepossible/spmodule-urd-transaction-pdf/
rm -rf ~/Documents/seepossible/spmodule-urd-transaction-pdf/.git
mv .git ~/Documents/seepossible/spmodule-urd-transaction-pdf/
cd ~/Documents/seepossible/spmodule-urd-transaction-pdf/
git remote add origin git@bitbucket.org:seepossible/spmodule-urd-transaction-pdf.git
git push --set-upstream origin master

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

# Re-apply template repository
Add template repository as remote:
```shell
git remote add template git@github.com:opzkit/tf-template.git;
```
Or for all:
````shell
for f in terraform-aws*; do
  cd $f && git remote add template git@github.com:opzkit/tf-template.git; git fetch --all && cd ..
done
````
The above only needs to be done once.

## Applying new template changes

````shell
git checkout main
git fetch --all
git create branch updates_from_template
git merge template/main --allow-unrelated-histories
````

Fix potential merge conflicts and then continue
````shell
git merge --continue
````

When finished, push the branch and create a PR. Choose to Squash & Merge the PR
````shell
git push --set-upstream origin updates_from_template
````

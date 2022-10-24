


for f in terraform-aws*; do
  cd $f && git remote add template git@github.com:opzkit/tf-template.git && git fetch --all && cd ..
done

gbc template
git cherry-pick --no-commit --allow-empty 1c8badd7f7a4ffa2b80d26d84c5932ac52f184d0...807c49a8ae12ee7be4a0401877d4ac7f86145a84

gcm "chore: rebase from template" && git cherry-pick --continue; gp
...repeat

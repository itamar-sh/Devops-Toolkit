# Commit Managment

### On This section we will cover the following commands
` git log `
` git show `
` git tag `
` git cherry-pick `
` git diff `

### See all the commits in the branch

` git log --oneline `

### See the chanes that has been made in a specific commit

` git show <commit-hash> `

### Give new name to specific commit
This is called tag. Every tag is relevant to specific commit, unrelated to a branch.

` git tag <new_tag_name> <commit-hash> `

### Add a commit to your branch
Every commit is unrelated to a branch, therefore we can add every commit to our branch.

` git cherry-pick <commit-hash> `

We also add a couple of commits with two dots between them

` git cherry-pick <first-commit-hash>..<last-commit-hash> `

The changes that will be made will get after adding and committing a new hash, since every commit is unique, even though
it has the same changes, even on the same code or branch.

In case of conflict - resolve the conflict in the code, add the changes, and use:

` git cherry-pick --continue `

### Compare two commits
This command will show the differences between two commits on the console:

` git diff <one-commit-hash> <second-commit-hash> `

This command will write the differences on a file, make it if isn't exists:

` git diff <one-commit-hash> <second-commit-hash> > output.diff `

We also could use the two dots two contain diff between several commits:

` git diff <first-commit-hash..<last-commit-hash> > output.diff `

# Branch Managment

### On This section we will cover the following commands
` git push `
` git reset `

### Replace a branch in a remote repositories
In case we want to replace the remote branch with our branch we can use push force.
One of this two:

` git push -f `
` git push --force `

This action is dangerous. Since you can delete commits on the remote branch.
Moreover, other people will probably need to know about this action. Their code will be probably required changes.

### Simulates pushing commits to a branch, no actual changes will be made

` git push --dry-run `

### uncommit, the code will not be changed, only move from commited to staged

` git reset --soft <commit-hash> `

### unstsage, the code will not be changed, only move from staged to unstaged

` git reset <commit-hash> `

### revert code, the code will be changed and return to the state of the given commit. 

` git reset --hard <commit-hash> `

### revert code, like --hard but if there is conflict the command will be aborted

` git reset --merge <commit-hash> `

### revert code to the last commited state

` git reset --hard `
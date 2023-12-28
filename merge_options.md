# Merge Options

### On This section we will cover the following commands


### rebase - Merge all new commits in one branch to another branch, mostly main branch

This command take a new feature branch, one that originally diverged from the main branch or the branch we want to merge
this feauture branch into. The command take all the new commits from the feature branch and place them, rebase them at
the main branch in this example.

So while on a feature_branch we do this command:

` git rebase main `

Now all the new commits will get a new hash values and be pushed to the main branch.

We can also use this command which is equal to the one above:

` git rebase main feature_branch `

I repeat, the branch that will be changed here is main branch. with new commits which has been in new_feature.

### rebase --onto - Merge all new commits in relation to main branch in another_feature_branch

This command take a new feature branch, one that originally diverged from the main branch or the branch we want to merge
this feauture branch into. The command take all the new commits from the feature branch and place them, rebase them at
the another_feature_branch in this example.

` git rebase --onto another_feature_branch main new_feature `

I repeat, the branch that will be changed here is another_feature_branch. with new commits which has been in new_feature.

### Show the commit when two branches were diverged
` git merge-base main new_feature `


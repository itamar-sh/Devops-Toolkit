# Remote Repo
In most cases we work with a repo stored on cloud. Now we will understand the basics to work this way.

### On This section we will cover the following commands

` git remote -v `

` git remote set-url <distant_repo_nickname> <distant_repo_url> `

` ssh-keygen -t <algorithm_name> -C "<your_email@example.com>" `


### Check currently remote repositories

` git remote -v `

The result will be something like that:

<img
  src="/images/remote_repo_images/1.png"
  alt="Alt text"
  title="Optional title"
  style="margin: 0 auto;" width="859" height="104">

### Set new remote repo
` git remote set-url <distant_repo_nickname> <distant_repo_url> `

for example:

` git remote set-url origin https://github.com/itamar-sh/Git-Toolkit.git `

### Establish ssh connection
Github or other remote version control can block your access via username and password. Since using ssh keys considered more secure way, we will learn how to use it.

#### make new ssh-key in your computer

` ssh-keygen -t <algorithm_name> -C "<your_email@example.com>" `

For example:

` ssh-keygen -t ed25519 -C "itamar.shechter123@gmail.com" `

<img
  src="/images/remote_repo_images/2.png"
  alt="Alt text"
  title="Optional title"
  style="margin: 0 auto;" width="1000" height="450">

#### upload ssh-key to your github
Search for the place in github and copy there the key fingertip printed from the last command.
Right now it's like that: settings -> ssh and gps -> add new ssh key.

### Clone and work remotely after ssh-key established
After both a key was genreated and the key finger tips added to github.
Go to a repo -> press on 'code' -> ssh part and copy the command.
Go to Terminal and write:
` git clone <ssh-command-copied> `

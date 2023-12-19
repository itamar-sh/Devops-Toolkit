# Repo Initialization
We want to start from basic folder and through examples we will learn the basic operations.

### On This section we will cover the following commands
` git init `
` git "" >> file1 `dcdcdcd
` git "" > file2 `
` git > file3 `
` git >> file4 `
` git clone <repo-url> `

## Git Basic Option

### Start position
We will start from empty folder.

<img
  src="/images/s1.png"
  alt="Alt text"
  title="Optional title"
  style="margin: 0 auto;" width="750" height="450">
  
To record the version of all changes in this enviroment we will need something to record the data.

we use:

` git init `

The folder may still be the same, but a lot happened in the bakground.

### Make Changes

For now we will ignore the fact that each command require commit and add and sometimes push and more.

#### new file

Each one of the following command will make a new file:

` git "" >> file1 `

` git "" > file2 `

` git > file3 `

` git >> file4 `

This is the current state: (In our Computer)

<img
  src="/images/s2.png"
  alt="Alt text"
  title="Optional title"
  style="margin: 0 auto;" width="750" height="450">

### Clone
In the most cases you will use a repo which is already exists, in this case you want to download a local copy of the repository to your computer.
The command ` git clone <repo-url> ` will make new directory in the current wokring directory with the local copy of the repository.

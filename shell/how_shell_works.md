# How shell works?

The terminal ranslate words to binary and backward when sending the command and get the ouput from the kernel.

## Command Execution Order

When getting command shell checks the command in this order:

1) Build-in command.

2) alias of a command.

3) command restored on the disk. The search is on directories in $PATH

IF the command isn't found in niether of those options, it return "command not found" error.
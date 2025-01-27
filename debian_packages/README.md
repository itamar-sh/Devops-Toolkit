# Debian package
A debian package is a collection of files and metadata bundled togoether. It's compiled for specific process architecture and contains system packages.

The goal it to store compiled libraries, a complete software, along with all the extra metadata and configurations to easy deploy the library.

Along with the files of the sofware itself the package also contains control scripts: pre and post of install and remove. Their job is to allow the package maintainers to define specific actions that should be executed during installation or removal. This can be very powerful.

## Debian Packacge Structure
Data Archive: Contains the actual files that get installed (binaries, configuration files, etc.).

Control Archive: Contains metadata files, such as control (describes the package), md5sums (for integrity checks), and optional scripts for installation and removal events.


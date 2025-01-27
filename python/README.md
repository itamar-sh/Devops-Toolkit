# Python installation
Usually, python3 is pre-installed on most OS, like in Ubuntu.
Anyway, this is the basic command using apt:

` sudo apt update && sudo apt install python3 `

Another python development tools you can install, it's not mendatory for example:

` sudo apt install python3-dev python3-pip python3-venv`

All packages available:

- `python#.#-pip`: installs the `pip` package manager, allowing you to install and manage Python packages from the Python Package Index (PyPI).
- `python#.#-dev`: includes development headers for building C extensions.
- `python#.#-venv`: provides the standard library `venv` module to create isolated Python environments.
- `python#.#-distutils`: provides the standard library `distutils` module for building and installing Python packages.
- `python#.#-lib2to3`: provides the `2to3-#.#` utility as well as the standard library `lib2to3` module for converting Python 2 code to Python 3.
- `python#.#-gdbm`: provides the standard library `dbm.gnu` module for GNU dbm database access.
- `python#.#-tk`: provides the standard library `tkinter` module for creating GUI applications.
- `python#.#-setuptools`: provides the `setuptools` package, which facilitates the packaging of Python projects and managing dependencies.

## Basic commands
- Shell command to find all python versions:

` dpkg -l | egrep " python3.(8|9|10|11) " | awk '{print $2}' `

- Shell command to find all apt package related to specific python version:

` dpkg -l | egrep " python3.8" | awk '{print $2}' `

## Virtualenv
Great incapsulation which you probalby want to use, even if you don't know it yet.

` virtualenv -p python3 myenv `

` python3 -m venv myenv `

` python3 -m virtualenv myenv `

Activating the virtualenv:
` source ${VENV_PATH}/$VENV_NAME/bin/activate `

## Change default version
My main recommend is simply don't. Most of the functionalities of changing python version you can do by openning
a matching virtualenv with which python version you want.
I will add complete guide when I will be sure in the whole process.

In the meantime you can check on those commands:

` sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.x 1 `

` sudo apt-get install python3.x python3.x-venv python3-pip `

` python3 -m pip install --upgrade pip `

` curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py `

` python3.x get-pip.py `

## How to create new package
There is a basic template in the package ` python_package_template `.

After the code is ready you can use the build command:

` python3 -m build python_package `


# Python compilation and execution
Python runs as an interpreted languag, which means the code is executed line by line, rather beign fully compiled to machine code before it runs.

The python interpreter takes python files and translate this source code into bytecode, which is a lower-level, platform-independent representation of the code. This is .pyc file and are usually stoed in a __pychache_ directory.
The bytecode is stored as binary but it's still not CPU arch bounded and is meaning is more like assembler.
The python interpreter is a C program with library in /usr/lib/python3 and binary at /usr/bin/python3 and it's already compiled to machine code for the OS and CPU architecure.

The second stage is to translate the bytecode into machine instructions specific to your system. This done by something called Python VIrtual Machine. The results are binary files and can be stored as .exe or .bin.

# Wheel
A python wheel is a collection of files and metadata bundled togoether. It's compiled for specific python version and contains python packages. It can not be compiled for many platforms but pip knows to give you the specific system architecture and operatin system you use.

The goal it to store compiled package, a complete software, along with all the extra metadata and configurations to easy deploy the library.

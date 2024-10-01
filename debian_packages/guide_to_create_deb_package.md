# Deb creation
The final command should look like this:
`dpkg-deb --build --root-owner-group {self._build_path}`

or for multi arch debian:
`dpkg-buildpackage -us -uc -b -rfakeroot`

You will need a standard Debian Package directory structure which look like this:

mypackage/
├── debian/
│   ├── control
│   ├── postinst (optional)
│   ├── postrm (optional)
│   ├── preinst (optional)
│   ├── prerm (optional)
│   └── [other files as needed]
└── [your application files, e.g., under `usr/`]

## Creating a standard Debian Package directory structure


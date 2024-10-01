# Debian Operation
Installation:
`sudo dpkg -i path/to/deb/ded_name.deb`
`sudo dpkg -i path/to/deb/ded_name_with_wildcard*.deb`

Enable other archs:
`sudo dpkg --add-architecture arm64`

Extract deb package content:
`dpkg -x path/to/deb/$deb_name.deb path/to/exrtact/dir/`

Download http url:
`wget url -P path/to/exrtact/dir/`


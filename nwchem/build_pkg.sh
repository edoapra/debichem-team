#!/bin/bash 
rm -f v*.tar.*
rm -rf nwchem*
uscan --download --download-current-version --verbose --destdir=. --force-download
tar xzf nwchem*.tar.gz
cp -rp debian nwchem-*/.
cd nwchem-*
dpkg-buildpackage  -rfakeroot -us -uc 

#!/bin/bash 
rm -f v*.tar.*
rm -rf nwchem*
#uscan --download --download-current-version --verbose --destdir=. --force-download
#tar xzf nwchem*.tar.gz
wget -q https://github.com/nwchemgit/nwchem/tarball/release-7-2-0 -O nwchem_7.2.0.orig.tar.gz
tar  --exclude=QA  --exclude=web --exclude=examples --exclude=doc  --exclude="nwxc*"  --exclude="chem-library-tests" --exclude=tce -xzf nwchem_7.2.0.orig.tar.gz
mv nwchemgit-nwchem-* nwchem-7.2.0
cp -rp debian nwchem-*/.
cd nwchem-*
dpkg-buildpackage  -rfakeroot -us -uc 

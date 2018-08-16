#!/bin/bash -f
rm -rf nwchem-6.8.1
NWCHEM_ORGNAME=6.8.1+133+gitge032219.orig
NWCHEM_TARNAME=6.8.1-release.revision-v6.8-133-ge032219-src.2018-06-14
if [ ! -f nwchem_"$NWCHEM_ORGNAME".tar.bz2 ]; then
curl  -L https://github.com/nwchemgit/nwchem/releases/download/6.8.1-release/nwchem-"$NWCHEM_TARNAME".tar.bz2 -o nwchem_"$NWCHEM_ORGNAME".tar.bz2
fi
tar xjf nwchem_"$NWCHEM_ORGNAME".tar.bz2
cp -rp debian nwchem-6.8.1/.
cd nwchem-6.8.1
dpkg-buildpackage  -rfakeroot -us -uc 

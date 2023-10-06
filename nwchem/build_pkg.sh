#!/usr/bin/env bash 
rm -f v*.tar.*
rm -rf nwchem*
#uscan --download --download-current-version --verbose --destdir=. --force-download
#tar xzf nwchem*.tar.gz
wget -q https://github.com/nwchemgit/nwchem/tarball/hotfix/release-7-2-0 -O nwchem_7.2.1.orig.tar.gz
#tar  --exclude=web --exclude=examples --exclude=doc  --exclude="nwxc*"  --exclude="chem-library-tests"  -xzf nwchem_7.2.0.orig.tar.gz
tar    -xzf nwchem_7.2.1.orig.tar.gz
mv nwchemgit-nwchem-* nwchem-7.2.1
cp -rp debian nwchem-*/.
cd nwchem-*
# to fix running openmpi as root in docker
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
dpkg-buildpackage  -rfakeroot -us -uc 

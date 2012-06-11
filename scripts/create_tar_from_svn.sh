#!/bin/sh

# Script to create a release tar.gz from subversion export and (not yet implemented)
# upload to the download section of googlecode.

# Created by Paul Gevers <paul@climbing.nl> (30 Aug 2009)
# Updated 11 Jan 2012
# Copyright 2011 by Matthew Weatherford <matt@biggmatt.com>

VERSION=`grep FILEVERSION winff.rc | sed "{ s/FILEVERSION // ; s/,/./g }"`
VERSION=${VERSION%.0*}

SVN="/usr/bin/svn"
TAR="/bin/tar"
REPOSITORY="http://winff.googlecode.com/svn/branches/winff-1.4"
TMPDIR=`/bin/mktemp -d -t winff.XXXXXX` || exit 1

cd $TMPDIR
pwd
$SVN export $REPOSITORY winff
cd winff
rm -rf debian win32setup scripts
# winff.po file is not used by the package, but is up-to-date. Create winff.pot file out of it.
cd languages
cp winff.po winff.pot
mv winff.po winff.en.po
cd $TMPDIR
$TAR -czf winff-${VERSION}-source.tar.gz winff
echo "Source file can be found at ${TMPDIR}/winff-${VERSION}-source.tar.gz"

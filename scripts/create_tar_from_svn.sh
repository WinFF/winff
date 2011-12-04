#!/bin/sh

# Script to create a release tar.gz from subversion export and (not yet implemented)
# upload to the download section of googlecode.

# Created by Paul Gevers <paul@climbing.nl> (30 Aug 2009)
# Updated 14 Feb 2011
# Copyright 2011 by Matthew Weatherford <matt@biggmatt.com>

VERSION=`grep FILEVERSION winff.rc | sed "{ s/FILEVERSION // ; s/,/./g }"`
VERSION=${VERSION%.0*}

SVN="/usr/bin/svn"
TAR="/bin/tar"
REPOSITORY="http://winff.googlecode.com/svn/trunk/%20winff%20--username%20bggmtt"
TMPDIR=`/bin/mktemp -d -t winff.XXXXXX` || exit 1

cd $TMPDIR
pwd
$SVN export $REPOSITORY winff
cd winff
rm -rf debian win32setup scripts
cd $TMPDIR
$TAR -czf winff-${VERSION}-source.tar.gz winff
echo "Source file can be found at ${TMPDIR}/winff-${VERSION}-source.tar.gz"

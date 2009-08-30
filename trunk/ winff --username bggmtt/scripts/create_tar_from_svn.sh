#!/bin/sh

# Script to create a release tar.gz from subversion export and (not yet implemented)
# upload to the download section of googlecode.

# Created by Paul Gevers <paul@climbing.nl> (30 Aug 2009)
# Copyright 2009 by Matthew Weatherford <matt@biggmatt.com>

VERSION="1.1.1"
SVN="/usr/bin/svn"
TAR="/bin/tar"
REPOSITORY="http://winff.googlecode.com/svn/trunk/%20winff%20--username%20bggmtt"
TMPDIR=`/bin/mktemp -d -t winff.XXXXXX` || exit 1

cd $TMPDIR
pwd
$SVN export $REPOSITORY winff
cd winff
rm -rf debian hardy intrepid jaunty win32setup
cd $TMPDIR
$TAR -czf winff-${VERSION}-source.tar.gz
echo "Source file can be found at ${TMPDIR}/winff-${VERSION}-source.tar.gz"

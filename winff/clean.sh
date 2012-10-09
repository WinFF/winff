#!/bin/sh
rm -f *~
rm -f *.o
rm -f *.ppu
rm -f *.res
rm -f *.rst
rm -f *.lrs
rm -f *.lps
rm -f *.bak
rm -f winff.exe
rm -f winff
rm -f *.or
rm -f *.compiled
rm -f backup/*
if [ -d backup ] ; then rmdir backup ; fi
rm -f magnifier

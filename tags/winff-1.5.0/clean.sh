#!/bin/sh
rm -f *~
rm -f *.o   # Build object files
rm -f *.ppu # Compiled unit file
rm -f *.res
rm -f *.rst
rm -f *.lrs # binary layout files; created from *.lfm
rm -f *.lrt # language build files: input for *.po generation
rm -f *.lps
rm -f *.bak
rm -f winff.exe
rm -f winff
rm -f *.or
rm -f *.compiled
rm -f backup/*
if [ -d backup ] ; then rmdir backup ; fi
rm -f magnifier

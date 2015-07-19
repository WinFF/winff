# Introduction #

Winff is included in Ubuntu. Just search for it in your favorite package manager and install from there. ONLY if you want faster update or newer versions, our Ubuntu packages are available at http://winff.org/ and at my [Personal Package Archive (PPA)](https://launchpad.net/~paul-climbing/+archive/ppa) provided by [Launchpad](http://launchpad.net).

Also a fuller featured ffmpeg is available via [Medibuntu](http://www.medibuntu.org/) for Lucid, Maverick and Natty users (via lib`*`-extra-`*` packages).

# Details Winff #

The Ubuntu repositories come in two flavors. We provide our repository at http://winff.org or you can use the repository at [Launchpad](https://launchpad.net/~paul-climbing/+archive/ppa). We prefer the later.

## How do I use software from a PPA? ##

To start installing and using software from a Personal Package Archive, you first need to tell Ubuntu where to find the PPA.

Step 1: Open a terminal and enter:
```
sudo add-apt-repository ppa:paul-climbing/ppa
```

Your system will now fetch the PPA's key. This enables your Ubuntu system to verify that the packages in the PPA have not been interfered with since they were built.

Step 2: Now, as a one-off, you should tell your system to pull down the latest list of software from each archive it knows about, including the PPA you just added:
```
sudo apt-get update
```

Now you're ready to start installing software from the PPA!

Step 3: You can now install WinFF directly by running:
```
sudo apt-get install winff
```

Step 4 (optional): Install the unstripped version of ffmpeg:
```
sudo apt-get install libavcodec-extra-53
```

# Warning non standard ffmpeg #
If you don't run the standard Ubuntu ffmpeg and want to make use of the more extended original set of presets, please read the README.Debian (1) after installation. If you find that your presets don't work, try the other presets files that are available [here](http://code.google.com/p/winff/downloads/list).

In order to use an other presets file than supplied with the package you might need to remove the old preset file in ~/.winff/presets.xml , but by doing that you will also remove self-made presets. So if you made or edited the presets, you want to compare the files manually.

(1) /usr/share/doc/winff/README.Debian

# Details extended ffmpeg in Ubuntu #

For a fuller ffmpeg than the standard on in your flavor of Ubuntu I refer to the excellent guide in the Ubuntu-forums: http://ubuntuforums.org/showthread.php?t=1117283 If you want to compile your own ffmpeg (it is not so hard) you can follow the instructions here: http://ubuntuforums.org/showthread.php?t=786095

Ubuntu contains a pretty complete ffmpeg already, but you probably want to have the 'unstripped' versions of several libraries. You can install them directly: libavcodec-extra-53, libavutil-extra-51 and libavformat-extra-53 from the multiverse repository. For AAC support you should install the [Medibuntu](http://www.medibuntu.org/) version of ffmpeg, (see the [Medibuntu wiki](https://help.ubuntu.com/community/Medibuntu)). The full explanation is available at https://help.ubuntu.com/community/Medibuntu.
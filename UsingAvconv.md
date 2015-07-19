# Introduction #

Due to some different opinions about how to run the project, ffmpeg developers split up between the ffmpeg project and the libav project. Both provide basically the same functionality. Several Linux distributions started to use the libav variant for the conversion binaries. Instead of the original program called ffmpeg, the tool got some changed interface and got a new name: avconv.

# Details #

How to tell winff to use avconv? In the winff menu, go to Edit -> Preferences. In the pop-up window go to the Linux tab and change the "Path to FFmpeg Executable" to /usr/bin/avconv. That's it. See below. The same is possible for avplay.

![http://winff.googlecode.com/files/winff_linux_preferences_avconv.png](http://winff.googlecode.com/files/winff_linux_preferences_avconv.png)
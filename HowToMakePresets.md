Making presets for WinFF is not difficult, it's learning the ffmpeg command line. All in all the ffmpeg command line really isn't that complicated considering what's being done.

So, say we wanted to create h264 preset.

The first thing to do is some googling for the h264 codecs and specification. I found that h264 requires "aac" audio codec and the video codec for ffmpeg is appropriately named "h264" (not always the case). H264 is also a mp4 file format so the extension (and also the container for ffmpeg) is "mp4"

To create the preset for it:

open WinFF

go to the filemenu and select edit presets and the preset editor will appear:

![http://winff.org/images/stories/createpresetpics/editpreset1.png](http://winff.org/images/stories/createpresetpics/editpreset1.png)

Enter the following for the name,label, command line, and extension:

name: h264

label: h264

command line: -acodec aac -vcodec h264

output file extension: mp4

![http://winff.org/images/stories/createpresetpics/editpreset2.png](http://winff.org/images/stories/createpresetpics/editpreset2.png)

Click "Add/Update"

Click OK to add the preset

Click SAVE to save the presets and return to winff



Try out your new Preset ;)

also remember different codecs need different bitrates, frame rates, etc...
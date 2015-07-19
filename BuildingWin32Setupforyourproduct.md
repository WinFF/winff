# Introduction #
This document will show you the basic of building a custom version of WinFF for your product. For example if you wish to create a version of winff with just your presets or for a custom version of ffmpeg

# Getting Started #

The First thing you will need is the WIN32Setup folder from svn. I use [Tortoise svn](http://tortoisesvn.tigris.org/), but you can use what ever you like.

The next thing you will need is Jordan Russell's [Inno Setup](http://www.innosetup.com/isinfo.php)

Once you have Innosetup installed you need to get the following language files for it on the [unofficial language page](http://www.innosetup.com/files/istrans/):
  * Bulgarian
  * Turkish
  * Chinese Traditional

Then put the language files in "C:\Program Files\Inno Setup 5\Languages" with the following names:
  * Bulgarian.isl
  * Turkish.isl
  * Chinesetrad.isl

Once this is done you are ready to build WinFF Setup.


# Building WinFF Setup #

Open the win32setup folder in the svn folder. Double click on winff04.iss. Innosetup will open. Go to the build menu and choose compile.

WinFF setup will now be built and put in the output folder as setup.exe.

# Customizing #

## Presets ##
The presets.xml located in the win32setup folder can be replaced with any preset file you like. For how to make a new preset please see [HowToMakePresets](HowToMakePresets.md). You can replace the preset file with your own set of presets or just add some to it.

the preset file format looks like:
```
<?xml version="1.0"?>
<presets>
  <divx>
    <label>MS Compatible AVI</label>
    <params>-f avi -acodec libmp3lame -vcodec msmpeg4v2 -ab 192</params>
    <extension>avi</extension>
    <category>AVI</category>
  </divx>
  <wmv>
    <label>WMV2</label>
    <params>-vcodec wmv2  -acodec wmav2</params>
    <extension>wmv</extension>
    <category>WMV</category>
  </wmv>

  <blackberryfs>
    <label>Blackberry Video 4:3</label>
    <params>-r 24 -vcodec libx264 -s 240x180 -aspect 4:3 -maxrate 800k -bufsize 80k -b 400k -acodec libfaac -ar 44100 -ab 80k -ac 2</params>
    <extension>mp4</extension>
    <category>Mobile Phones</category>
  </blackberryfs>
</presets>

```

Once you have your preset file ready to go, just replace presets.xml in the win32setup folder and rebuild winff setup.

## FFmpeg ##
WinFF 0.43 comes with FFmpeg svn [revision 13712](https://code.google.com/p/winff/source/detail?r=13712) built by [Ramiro Polla](http://ffmpeg.arrozcru.org/). You can find how to build your own or use one of Ramiro Polla's build from his page.

Usually the ffmpeg builds include ffmpeg.exe, ffplay.exe, sdl.dll, and pthreadGC2.dll. If the version you built or a later one does not exactly contain these files then they must be removed from the innosetup script and the new ones added:

```
Source: "ffmpeg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "ffplay.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "pthreadGC2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "SDL.dll"; DestDir: "{app}"; Flags: ignoreversion
```

to add a new file copy one of the existing files and replace it like:
```
Source: "Mynewfile.exe"; DestDir: "{app}"; Flags: ignoreversion
```

to remove a file, just remove the entire line that references the files.

# Changing the Version and other info #
If you create a custom version of winff you must say so in the installer as per the GNU public License.

To change the installer info in the ISS script:
```
[Setup]
AppID=WinFF
AppName=WinFF
AppVerName=WinFF 0.43
AppPublisher=WinFF.org
AppPublisherURL=http://www.winff.org/
AppSupportURL=http://biggmatt.com/forums
AppUpdatesURL=http://www.winff.org/
DefaultDirName={pf}\WinFF
DefaultGroupName=WinFF
VersionInfoVersion=0.4.3.0
AllowNoIcons=yes
LicenseFile=License.txt
OutputDir=output
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
SetupIconFile=WinFF.ico
```

changing the app ID will make it possible to install the custom version and the standard winff at the same time.

You should change the publisher URL, Appsupport, and updates urls.

You may change the defualt Dir name to install to where ever you like.

The default group names is the start menu folder to create

Allow No Icons, allows the user to not create a desktop icon.


Once you have these changes rebuild winff setup and you should have your new version.
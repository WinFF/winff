Unfortunately different versions of ffmpeg have different parameters. Therefore you can find several versions of the presets file in the [download section](http://code.google.com/p/winff/downloads/list). Here is what to do with the new file.

Be aware that the procedure described here removes customization of our presets, so if you have edited the presets, you have to merge the new file manually if you want to keep your changes.

# Individual users #

To install the new presets for the current user, unzip/untar the downloaded file, (if necessary) rename it have the extension ".wff" and import it into winff by **one** of the following procedures:
  * File -> "Import preset" and select the file in the pop-up window.
  * Selecting the file in a file browser.
  * Edit -> "Edit presets", press "Import" in the pop up window, and select the file in the next pop-up window.
  * Start Winff from the command line with the file path as argument: `winff /path/to/file`
In all cases press "All" or "Yes to All" on request.

# Linux system wide #

**This procedure might prevent successful updates if you are using standard Debian/Ubuntu updates.** If you want to change the system wide presets file, unzip/untar the downloaded file and copy the new file to /usr/share/winff/presets.xml. If you install to the system each existing user must update his presets as well by following the above mentioned procedure for individual users.

# Windows system wide #

If you want to change the system wide presets.xml file, unzip/untar the downloaded file and copy the new file to "`c:\program files\winff\`".  If you install to the system each existing user must update his presets as well by following the above mentioned procedure for individual users.
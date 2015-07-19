# Translating WinFF #

## Via the web ##
Register at launchpad and translate away: https://translations.launchpad.net/winff/

## With your local editor ##
The winff.po can be translated using a text editor or programs such as a kbabel for linux, poedit for windows and linux. I'm going to cover using a text editor.

Get the latest file from [svn](http://code.google.com/p/winff/source/checkout)

Once you have the file, open it in your text editor. The Gnome editor is great. If your using windows I don't recommend notepad, but it should work theoretically.


Once in the file you will see a bunch of lines like:


```
    #: unit1:rsdisplaycmdline
    msgid "Display CMD Line"
    msgstr "" 
```


The First line is the English line, and should must remain as it is. The second line is where the translation should go. For example from Kai Evers German translation:


```
    #: unit1:rsdisplaycmdline
    msgid "Display CMD Line"
    msgstr "Kommandozeile anzeigen" 
```


Continue to complete the entire file.

The file should be named with the two character abbreviation for your language. For example, use winff.ru.po for Russian and winff.es.po for Spanish. Once you completed, you can try out the file. For windows it should be put in "C:\program files\winff\languages" folder. For linux it should go in "/usr/share/winff/languages"



Some pointers:

  * Do not use the single quote - ' -
  * AC is audio channel.

Once you are happy with your translation, upload it to our [bug tracker](http://code.google.com/p/winff/issues/list) as wish list bug.

New translations will be posted on winff.org, and will come out with next release.

Thanks in advance for translating.

# How to update the po file from the newest winff.po file using poedit #

  1. Get the latest version of winff.po and the language file winff.XX.po you want to correct. (see [svn](http://code.google.com/p/winff/source/browse/#svn/trunk/%20winff%20--username%20bggmtt/languages))
  1. Open the language PO file with poEdit.
  1. In menu bar, go to Catalog-> Update from POT file... Select winff.po and open. (You will have to make sure you can select from all files. An alternative is renaming winff.po to winff.pot first).
  1. A pop up window will appear showing 'New strings' and 'Obsolete strings'. Press OK.
  1. The important part. You have to UPDATE all review strings marked as "fuzzy" (yellow).
  1. If you've done updating, send us your new file (or post it on the forum).
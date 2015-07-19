# Introduction #

Recently added to our distribution builds are Fedora builds provided by Richard Shaw.

# Details #

The end user can either download the rpm and let the GUI prompt them
to install it or more advanced users can do:
```
yum install http://winff.org/docs/rpm/fedora/winff-repo-1.0-1.noarch.rpm
```

as root, then:
```
yum install winff
```

or if you want the testing packages (WinFF 1.5.0 does not currently build for Fedora 16 which is now EOL.):
```
yum --enablerepo=winff-testing install winff
```

# Download #

If you want to download the rpm's directly (i.e. without getting updates automatically) you can browse our repository [here.](http://winff.org/html_new/rpm_overview.html)
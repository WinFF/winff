# Introduction #

Winff is included in Debian. Just search for it in your favorite package manager and install from there. ONLY if you want faster update or newer versions, you can install any of the packages available at http://winff.org/ and at my [Personal Package Archive (PPA)](https://launchpad.net/~paul-climbing/+archive/ppa) provided by [Launchpad](http://launchpad.net).

# Details Winff #

If you are running the stable version of Debian you can easily install WinFF by using our Ubuntu repositories. The repositories come in two flavors. We provide our repository at http://winff.org or you can use the repository at [Launchpad](https://launchpad.net/~paul-climbing/+archive). We prefer the later.

If you use the winff repository you need to accept the key [AAFE086A](http://winff.org/ubuntu/AAFE086A.gpg). To get that installed you can run:

```
wget --quiet --output-document=- "http://winff.org/ubuntu/AAFE086A.gpg" | sudo apt-key add -
```

After that you need to add the repository to apt. You can do that by entering the line (1) in /etc/apt/sources.list.d/winff.list. You will have to create that file, which can be done with the following command:
```
echo "deb http://winff.org/ubuntu lucid universe" | sudo tee /etc/apt/sources.list.d/winff.list
```
You can also just add the line to /etc/apt/sources.list .

After you update using your favorite package manager (2) you can just choose winff from the list. If you have winff installed from Matt's package file, you might need to uninstall that first.

You can install WinFF directly now by running:
```
sudo apt-get update && sudo apt-get install winff
```

If you don't run the standard ffmpeg and want to make use of the more extended original set of presets, which you can download in the [download](http://code.google.com/p/winff/downloads/list) section.

In order to use the preset file supplied with the package you might need to remove the old preset file in ~/.winff/presets.xml , but by doing that you will also remove self-made presets. So if you made or edited the presets, you want to compare the files manually.


---

**If you are having problems** with the described procedure, please file a bug in our [bug tracker](http://code.google.com/p/winff/issues/list). Please include in the bug the output of
```
cat /etc/apt/sources.list.d/winff.list
```
and
```
sudo apt-get update && sudo apt-get install winff
```

---


(1) `deb http://winff.org/ubuntu lucid universe`
_(or if you use the PPA:)_
`deb http://ppa.launchpad.net/paul-climbing/ubuntu lucid main`

(2) for instance `sudo apt-get update` or while in synaptic pressing "Reload"

(3) /usr/share/doc/winff/README.Debian
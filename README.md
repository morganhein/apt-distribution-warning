# APT Flat-File Repo Warning

This warning has not existed previously (specifically in xenial, not sure when it appeared in Debian/apt).

This repository is created using the mechanism described here: https://www.debian.org/doc/manuals/debian-handbook/sect.setup-apt-package-repository.en.html

If the codename and/or suite in the Release file is changed to "repo/" the error goes away, but in my specific situation this is not-ideal, and i'm not sure of the downstream effects of doing so.

## Run this
```bash
docker build -t debaptfail .
docker run --rm debaptfail
``` 

You should see an output similar to this:

```bash
Creating Packages files.
dpkg-scanpackages: warning: Packages in archive but missing from override file:
dpkg-scanpackages: warning:   2ping
dpkg-scanpackages: info: Wrote 1 entries to output Packages file.
Running apt-ftparchive release -c=/tmp/apt.conf  > /tmp/repo/Release
Get:1 file:/tmp repo/ InRelease
Ign:1 file:/tmp repo/ InRelease
Get:2 file:/tmp repo/ Release [1303 B]
Get:2 file:/tmp repo/ Release [1303 B]
Get:3 file:/tmp repo/ Release.gpg
Ign:3 file:/tmp repo/ Release.gpg
Get:4 file:/tmp repo/ Packages [564 B]
Reading package lists... Done
Building dependency tree       
Reading state information... Done
All packages are up to date.
W: Conflicting distribution: file:/tmp repo/ Release (expected repo/ but got stretch)
```

The issue is the conflicting distribution line.
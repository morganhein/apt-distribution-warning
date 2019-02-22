#!/usr/bin/env bash

# create the packages.gz file
echo "Creating Packages files."
cd /tmp/repo
dpkg-scanpackages . /dev/null > Packages
gzip -9k Packages

if [ $? != 0 ]; then
  echo "Could not create index file."
  exit 1
fi

echo "Running apt-ftparchive release -c=/tmp/apt.conf  > /tmp/repo/Release"
# Create the release file
apt-ftparchive release -c=/tmp/apt.conf /tmp/repo/ > /tmp/repo/Release
if [ $? != 0 ]; then
  echo "Could not create release file."
  exit 1
fi

rm -f /etc/apt/sources.list
mv /tmp/sources.list /etc/apt/sources.list
apt update
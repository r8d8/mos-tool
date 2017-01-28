#!/bin/sh

OS=`uname`
DESTDIR=/usr/local/bin
PROGNAME=mos
FULLPATH=$DESTDIR/$PROGNAME
MOS_URL=

if test "$OS" = Linux ; then
  MOS_URL=https://mongoose-iot.com/downloads/mos/linux/mos
elif test "$OS" = Darwin ; then
  MOS_URL=https://mongoose-iot.com/downloads/mos/mac/mos
else
  echo "Unsupported OS [$OS]. Only Linux or MacOS are supported."
  echo "FAILURE, exiting."
  exit 1
fi

if ! test -d $DESTDIR ; then
  echo "Directory $DESTDIR is not present, creating it ..."
  mkdir -p $DESTDIR
fi

echo "Downloading $MOS_URL ..."
curl -fsSL $MOS_URL -o $FULLPATH

echo "Installing into $FULLPATH ..."
chmod 755 $FULLPATH

echo "SUCCESS."
echo "$FULLPATH is successfully installed."
echo "Run '$PROGNAME --help' to see all available commands."
echo "Run '$PROGNAME' without arguments to start a simplified Web UI installer."
#!/bin/bash

SCALELITE_RECORDING_DIR=${SCALELITE_RECORDING_DIR-/mnt/scalelite-recordings/var/bigbluebutton}

echo 'Create the directory structure for recording ...'
mkdir -p $SCALELITE_RECORDING_DIR/spool
mkdir -p $SCALELITE_RECORDING_DIR/recording/scalelite
mkdir -p $SCALELITE_RECORDING_DIR/published
mkdir -p $SCALELITE_RECORDING_DIR/unpublished
chown -R 1000:2000 $SCALELITE_RECORDING_DIR
chmod -R 0775 $SCALELITE_RECORDING_DIR

echo 'Create symbolic link to the directory structure for uploading ...'
if [ -d "/var/bigbluebutton" ]; then
  mv /var/bigbluebutton /var/.bigbluebutton
elif [ -e "/var/bigbluebutton" ]; then
  rm /var/bigbluebutton
fi
ln -s $SCALELITE_RECORDING_DIR /var/bigbluebutton

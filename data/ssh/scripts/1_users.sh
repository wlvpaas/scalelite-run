#!/bin/bash

echo 'Create a new group with GID 2000...'
if grep -q scalelite-spool /etc/group; then
  echo "group scalelite-spool exists"
else
  echo "group scalelite-spool created"
  groupadd -g 2000 scalelite-spool
fi

echo 'Add the bigbluebutton user to the group...'
usermod -a -G scalelite-spool bigbluebutton
#!/bin/sh
# a simple script to check if user is in a local group

# Specify the group name
GROUP_NAME="mygroup"

# Specify the user to check
USER_NAME="foobar"

# Get group members using getent
GROUP_MEMBERS=$(getent group "$GROUP_NAME" | cut -d: -f4 | tr ',' ' ')

# Check if the user is in the group
if echo "$GROUP_MEMBERS" | grep -qw "$USER_NAME"; then
  echo "yes"
else
  echo "no"
fi

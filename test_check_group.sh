#!/bin/sh

# Create a temporary group and user for testing
TEST_GROUP="testgroup"
TEST_USER="testuser"

# Add a temporary group
sudo groupadd "$TEST_GROUP"

# Add a temporary user
sudo useradd -m "$TEST_USER"

# Add the user to the group
sudo usermod -a -G "$TEST_GROUP" "$TEST_USER"

# Test case 1: User is in the group
RESULT=$(./check_group.sh)
if [ "$RESULT" = "yes" ]; then
  echo "Test Case 1 Passed: User is in the group."
else
  echo "Test Case 1 Failed: Expected 'yes', got '$RESULT'."
fi

# Remove the user from the group
sudo gpasswd -d "$TEST_USER" "$TEST_GROUP"

# Test case 2: User is not in the group
RESULT=$(./check_group.sh)
if [ "$RESULT" = "no" ]; then
  echo "Test Case 2 Passed: User is not in the group."
else
  echo "Test Case 2 Failed: Expected 'no', got '$RESULT'."
fi

# Cleanup: Remove the temporary user and group
sudo userdel -r "$TEST_USER"
sudo groupdel "$TEST_GROUP"


#!/bin/bash
################################################################################
# © Copyright 2012, Rockwell Collins, Inc.  All rights reserved.
#
# Information contained herein is privileged or confidential information
# of Rockwell Collins, Inc. within the meaning of 5 USC 552, and as such
# is exempt from the public disclosure provisions thereof.
#
# Security classification: UNCLASSIFIED
#
################################################################################

# This file will be run just before the file system is tarred up. Any changes
# done here will be the put into the final tar file.  The Makefile that calls 
# this script passes in the location of the target file system.

echo "********************************************"
echo "Installing the local_skeleton"
echo "********************************************"

# local skeleton directory
LOCAL_SKELETON=board/beagleboard/xm/local-skeleton
BINARIES_DIR=output/images/

# Set the permission to be correct (set local skeleton, not target)
#   This section will need to be expanded/modified as more files/directories are added
chmod 755 $LOCAL_SKELETON/etc
chmod 755 $LOCAL_SKELETON/etc/init.d
chmod 755 $LOCAL_SKELETON/etc/init.d/*
chmod 755 $LOCAL_SKELETON/etc/network
chmod 644 $LOCAL_SKELETON/etc/network/interfaces

chmod -R 755 $LOCAL_SKELETON/usr

# sshd won't use keys if permissions are too relaxed
chmod 600 $LOCAL_SKELETON/etc/ssh_host*  

# Copy the files to the target
if [ -d $LOCAL_SKELETON ]; then \
	cp -fa $LOCAL_SKELETON/* $1/; \
fi

# Remove all svn files from the target
rm -rf `find $1/ -type d -name .svn`

#########################################################################
#
# Security classification:  UNCLASSIFIED
#
#########################################################################

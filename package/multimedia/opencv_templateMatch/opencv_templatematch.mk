#############################################################
#
# opencv_templatematch
#
# © Copyright 2012, Rockwell Collins, Inc.  All rights reserved.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not see
# <http://www.gnu.org/licenses/>.
#############################################################
OPENCV_TEMPLATEMATCH_VERSION = HEAD
OPENCV_TEMPLATEMATCH_SOREV = 0.1
OPENCV_TEMPLATEMATCH_SITE = git://github.com/matthew-l-weber/opencv_templateMatch.git
OPENCV_TEMPLATEMATCH_DIR=$(@D)
OPENCV_TEMPLATEMATCH_SITE_METHOD = git
OPENCV_TEMPLATEMATCH_DEPENDENCIES = opencv

OPENCV_TEMPLATEMATCH_INSTALL_STAGING = NO
OPENCV_TEMPLATEMATCH_INSTALL_TARGET = YES

define OPENCV_TEMPLATEMATCH_BUILD_CMDS
	export TARGET_BIN=$(TARGET_CROSS); \
	export CFLAGS="$(TARGET_CFLAGS)"; \
	export SYSROOT=$(STAGING_DIR); \
	make -C $(OPENCV_TEMPLATEMATCH_DIR) 
endef

define OPENCV_TEMPLATEMATCH_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(OPENCV_TEMPLATEMATCH_DIR)/opencv_templatematch $(TARGET_DIR)/usr/bin
	/usr/bin/install -D -m 0755 /home/mlweber/Desktop/buildroot/output/build/opencv_templatematch-HEAD/opencv_templatematch /mnt/nas/matt/tmp/dummp/
endef

define OPENCV_TEMPLATEMATCH_CLEAN_CMDS
	make -s -C $(OPENCV_TEMPLATEMATCH_DIR) clean
	
endef

define OPENCV_TEMPLATEMATCH_UNINSTALL_TARGET_CMDS
	rm $(TARGET_DIR)/usr/bin/opencv_templatematch
endef

$(eval $(call GENTARGETS,package,opencv_templatematch))


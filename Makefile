#******************************************************************************
#*
#*  Copyright (C) 2009-2012 Broadcom Corporation
#*
#*  Licensed under the Apache License, Version 2.0 (the "License");
#*  you may not use this file except in compliance with the License.
#*  You may obtain a copy of the License at
#*
#*      http://www.apache.org/licenses/LICENSE-2.0
#*
#*  Unless required by applicable law or agreed to in writing, software
#*  distributed under the License is distributed on an "AS IS" BASIS,
#*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#*  See the License for the specific language governing permissions and
#*  limitations under the License.
#*
#******************************************************************************

CROSS_COMPILE:=/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/arm-fsl-linux-gnueabi-

LIBS = -L/home/ubuntu/CWM07/ltib/rootfs/usr/lib -lbluetooth
# CFLAGS=-g

CFLAGS= -I/home/ubuntu/CWM07/ltib/rpm/BUILD/bluez-libs-2.25/include

CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld
NM := $(CROSS_COMPILE)nm
OBJCOPY := $(CROSS_COMPILE)objcopy
STRIP := $(CROSS_COMPILE)strip

all : brcm_patchram_plus brcm_patchram_plus_h5 brcm_patchram_plus_usb brcm_patchram_plus_new

brcm_patchram_plus_new : brcm_patchram_plus_new.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

brcm_patchram_plus_h5 : brcm_patchram_plus_h5.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
	
brcm_patchram_plus : brcm_patchram_plus.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
	
brcm_patchram_plus_usb : brcm_patchram_plus_usb.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

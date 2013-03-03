# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false

# Use the non-open-source parts, if they're present
-include vendor/lge/p940/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
NEEDS_ARM_ERRATA_754319_754320 := true
BOARD_GLOBAL_CFLAGS += -DNEEDS_ARM_ERRATA_754319_754320

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_CUSTOM_BOOTIMG_MK := device/lge/p940/releasetools/boot.mk
TARGET_CUSTOM_RELEASETOOL := device/lge/p940/releasetools/squisher

BOARD_KERNEL_BASE := 0x80000000
#BOARD_KERNEL_CMDLINE :=

# Define kernel config for inline building
#TARGET_KERNEL_CONFIG := cyanogenmod_p940_defconfig
#TARGET_KERNEL_SOURCE := kernel/lge/p940
TARGET_PREBUILT_KERNEL := device/lge/p940/prebuilt/kernel

TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := p940

COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"chg"' -DBOARD_CHARGING_CMDLINE_VALUE='"65"'

TARGET_SPECIFIC_HEADER_PATH := device/lge/p940/include/

USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/lge/p940/config/egl.cfg

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# OMAP
OMAP_ENHANCEMENT := true
OMAP_ENHANCEMENT_CPCAM := true
ifdef OMAP_ENHANCEMENT
  COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP4 -DOMAP_ENHANCEMENT_CPCAM -DOMAP_ENHANCEMENT_VTC
endif

TARGET_USES_GL_VENDOR_EXTENSIONS := false

BOARD_USES_TI_CAMERA_HAL := true
TI_OMAP4_CAMERAHAL_VARIANT := DONOTBUILDIT
HARDWARE_OMX := true

BOARD_VOLD_MAX_PARTITIONS := 16
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457862144
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_HAS_LARGE_FILESYSTEM := true

# Wifi related defines
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_b2
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/fw_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_BAND                   := 802_11_ABG
BOARD_LEGACY_NL80211_STA_EVENTS := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p940/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/lge/p940/bluetooth/vnd_p940.txt

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# ics audio+camera blobs
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DICS_CAMERA_BLOB

BOARD_LIB_DUMPSTATE := libdumpstate.p940

BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"

BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/p940/vibrator.c

# Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p940/ril/

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

BOARD_RECOVERY_ALWAYS_WIPES := true
TARGET_RECOVERY_INITRC := device/lge/p940/recovery/init.rc
BOARD_UMS_LUNFILE := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun0/file"
TARGET_RECOVERY_PRE_COMMAND := "echo 'boot-recovery' > /dev/block/mmcblk0p6; sync"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HDPI_RECOVERY := true
BOARD_USE_CUSTOM_FONT := true

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

#twrp
DEVICE_RESOLUTION := 480x800
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_INTERNAL_STORAGE_PATH := "/external_sd"
TW_INTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

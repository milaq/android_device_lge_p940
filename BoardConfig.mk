#
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
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/lge/p940/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x80000000
BOARD_PAGE_SIZE := 0x00000800
BOARD_KERNEL_CMDLINE :=

# Define kernel config for inline building
#TARGET_KERNEL_CONFIG := p2_p940_defconfig
#TARGET_KERNEL_SOURCE := kernel/lge/p940

TARGET_PREBUILT_KERNEL := device/lge/p940/prebuilt/kernel

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := p940

USE_OPENGL_RENDERER := true

BOARD_EGL_CFG := device/lge/p940/egl.cfg

## Ignore --wipe_data sent by the bootloader
BOARD_RECOVERY_ALWAYS_WIPES := true
TARGET_RECOVERY_INITRC := device/lge/p940/recovery/init.rc
BOARD_RECOVERY_IGNORE_BOOTABLES := true

BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p14
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p14
BOARD_VOLD_MAX_PARTITIONS := 16
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

BOARD_HAS_NO_MISC_PARTITION := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457862144
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_NEVER_UMOUNT_SYSTEM := true

#TARGET_PROVIDES_INIT_RC := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

TARGET_CUSTOM_RELEASETOOL := device/lge/p940/releasetools/squisher
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/lge/p940/releasetools/p940_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/lge/p940/releasetools/p940_ota_from_target_files

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lge/p940/recovery/recovery_keys.c

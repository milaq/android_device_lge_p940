# Copyright (C) 2012 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := device/lge/p940/overlay

# This device is hdpi.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
	charger \
	charger_res_images

PRODUCT_PACKAGES += \
	libinvensense_mpl

PRODUCT_COPY_FILES := \
	device/lge/p940/init.lgep940board.rc:root/init.lgep940board.rc \
	device/lge/p940/init.p940.ril.rc:root/init.p940.ril.rc \
	device/lge/p940/init.p940.usb.rc:root/init.p940.usb.rc \
	device/lge/p940/ueventd.lgep940board.rc:root/ueventd.lgep940board.rc \
	device/lge/p940/prebuilt/init.rmnet:system/bin/init.rmnet \
	device/lge/p940/prebuilt/init.rmnet-down:system/bin/init.rmnet-down \
	device/lge/p940/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/p940/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml \
	device/lge/p940/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# hijack/bootstrap
PRODUCT_COPY_FILES += \
	device/lge/p940/bootstrap/hijack:system/bin/hijack

PRODUCT_COPY_FILES += \
	device/lge/p940/bootstrap/2nd-init:system/bootstrap/2nd-init \
	device/lge/p940/bootstrap/getkey:system/bootstrap/getkey \
	device/lge/p940/bootstrap/taskset:system/bootstrap/taskset \
	device/lge/p940/bootstrap/stop:system/bootstrap/stop \
	device/lge/p940/bootstrap/unsecureboot:system/bootstrap/unsecureboot

# 2nd init ramdisks
PRODUCT_COPY_FILES += \
	device/lge/p940/bootstrap/recovery.tar:system/bootstrap/recovery.tar

	
PRODUCT_COPY_FILES += \
	device/lge/p940/prebuilt/init.d/01modules:system/etc/init.d/01modules

# keylayouts and touchscreen
PRODUCT_COPY_FILES += \
	device/lge/p940/prebuilt/omap-keypad.kl:system/usr/keylayout/omap-keypad.kl \
	device/lge/p940/prebuilt/osp-input.kl:system/usr/keylayout/osp-input.kl \
	device/lge/p940/prebuilt/touch_dev.kl:system/usr/keylayout/touch_dev.kl \
	device/lge/p940/prebuilt/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl \
	device/lge/p940/prebuilt/touch_dev.idc:system/usr/idc/touch_dev.idc \
	device/lge/p940/prebuilt/osp-input.idc:system/usr/idc/osp-input.idc

# Kernel Modules
PRODUCT_COPY_FILES += $(shell \
	find device/lge/p940/prebuilt/modules -name '*.ko' \
	| sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
	| tr '\n' ' ')

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_COPY_FILES += \
	device/lge/p940/prebuilt/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	wifi.features=p2p \
	wifi.supplicant_scan_interval=20

PRODUCT_PACKAGES += \
	lights.p940

# NFC
PRODUCT_PACKAGES += \
        libnfc \
        libnfc_jni \
        Nfc \
        Tag

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Portrait dock image
PRODUCT_COPY_FILES += \
    device/lge/p940/dock.png:system/vendor/res/images/dock/dock.png

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
	packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# file that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
	device/sample/nxp/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras
PRODUCT_COPY_FILES += \
	frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/p940/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/p940/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

LOCAL_PATH := device/lge/p940
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Vold and Storage
PRODUCT_COPY_FILES += \
	device/lge/p940/vold.fstab:system/etc/vold.fstab

PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.switchablepair=/mnt/emmc,/mnt/sdcard

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
# goo.im stuff
$(call inherit-product, device/lge/p940/goo.mk)

$(call inherit-product-if-exists, vendor/nxp/pn544/nxp-pn544-fw-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)

$(call inherit-product-if-exists, vendor/lge/p940/device-vendor.mk)

BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

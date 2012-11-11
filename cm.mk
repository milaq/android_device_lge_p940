## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := P940

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/lge/p940/full_p940.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := p940
PRODUCT_NAME := cm_p940
PRODUCT_BRAND := lge
PRODUCT_MODEL := Prada 3.0
PRODUCT_MANUFACTURER := LGE

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=p940 BUILD_FINGERPRINT="lge/p940/p940:4.1.2/IMM76P/47E63EA8:user/release-keys" PRIVATE_BUILD_DESC="p940-user 4.1.2 IMM76P 330938 release-keys"

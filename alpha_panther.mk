#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Use Scudo instead of Jemalloc
PRODUCT_USE_SCUDO := true

# Device config
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_FACE_UNLOCK_SUPPORTED := false

# Build config

# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
TARGET_BUILD_PACKAGE := 3

# (valid only for GAPPS builds)
TARGET_INCLUDE_GOOGLE_COMMS := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := false
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := false

# Debugging
TARGET_INCLUDE_MATLOG := false
WITH_ADB_INSECURE := true

# Extras
TARGET_INCLUDE_RIMUSIC := false

# Maintainer
ALPHA_BUILD_TYPE := Official
ALPHA_MAINTAINER := Duhjoker

# To include Gapps 
WITH_GMS := true

WITH_PIXEL_OVERLAYS := true

DISABLE_ARTIFACT_PATH_REQUIREMENTS := true

# include pixel parts
include packages/apps/PixelParts/device.mk

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/alpha/config/common_full_phone.mk)

# Inherit device configuration
DEVICE_CODENAME := panther
DEVICE_PATH := device/google/pantah
VENDOR_PATH := vendor/google/panther
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)
$(call inherit-product, device/google/gs201/lineage_common.mk)
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7
PRODUCT_NAME := alpha_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="panther-user 15 BP1A.250505.005.B1 13277630 release-keys" \
    BuildFingerprint=google/panther/panther:15/BP1A.250505.005.B1/13277630:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

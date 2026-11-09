#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from TECNO-KI5m device
$(call inherit-product, device/tecno/TECNO-KI5m/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := TECNO-KI5m
PRODUCT_NAME := lineage_TECNO-KI5m
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO KI5m
PRODUCT_MANUFACTURER := tecno

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="KI5m-user 12 SP1A.210812.016 219 release-keys" \
    BuildFingerprint=TECNO/KI5m-GL/TECNO-KI5m:12/SP1A.210812.016/GL-20240612V218:user/release-keys

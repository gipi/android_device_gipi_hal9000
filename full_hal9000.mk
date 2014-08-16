# full.mk also include emulator.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, device/gipi/hal9000/device.mk)

# from build/core/main.mk
#BUILD_TINY_ANDROID := true

# Overrides
PRODUCT_NAME := full_hal9000
PRODUCT_DEVICE := hal9000
PRODUCT_BRAND := Android
PRODUCT_MODEL := hal9000
PRODUCT_MANUFACTURER := gipi

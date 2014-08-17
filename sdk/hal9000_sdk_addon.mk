# The name of this add-on (for the SDK)
PRODUCT_SDK_ADDON_NAME := hal9000_addon

PRODUCT_SDK_ADDON_COPY_FILES := \
        $(LOCAL_PATH)/manifest.ini:manifest.ini \
        $(LOCAL_PATH)/hardware.ini:hardware.ini

# FIXME: factorize
LOCAL_KERNEL := $(LOCAL_PATH)/../kernel
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel
# Since the add-on is an emulator, we also need to explicitly copy the kernel to images
PRODUCT_SDK_ADDON_COPY_FILES += $(LOCAL_KERNEL):images/kernel-qemu

# source <https://groups.google.com/forum/#!topic/android-building/XIdm_KZGNuY>
# To silent 'egl.cfg' has nothing to install
# We just use a generic one
BOARD_EGL_CFG := device/generic/goldfish/opengl/system/egl/egl.cfg

# This add-on extends the default sdk product.
$(call inherit-product, $(SRC_TARGET_DIR)/product/sdk.mk)

# The name of this add-on (for the build system)
# Use 'make PRODUCT-<PRODUCT_NAME>-sdk_addon' to build the an add-on,
# so in this case, we would run 'make PRODUCT-hal9000_sdk_addon-sdk_addon'
# IMPORTANT: PRODUCT_NAME must be equal to this file name otherwise it'll be not found
PRODUCT_NAME := hal9000_sdk_addon
PRODUCT_DEVICE := hal9000
PRODUCT_MODEL := Hal9000 SDK Addon Image for Emulator

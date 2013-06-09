
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

TARGET_PREBUILT_KERNEL := kernel/arch/arm/boot/zImage

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
# this is here to use the pre-built kernel


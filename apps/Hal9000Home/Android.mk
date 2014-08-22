LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_MANIFEST_FILE := app/src/main/AndroidManifest.xml
LOCAL_SRC_FILES := $(call all-java-files-under,app/src/main/java/)
LOCAL_RESOURCE_DIR := $(addprefix $(LOCAL_PATH)/,app/src/main/res/)
#LOCAL_JAVA_LIBRARIES := android.eeplab.es
LOCAL_PACKAGE_NAME := Hal9000Home
LOCAL_OVERRIDES_PACKAGES := Home

include $(BUILD_PACKAGE)

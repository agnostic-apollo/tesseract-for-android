LOCAL_PATH := $(call my-dir)
TESSERACT_PATH := $(LOCAL_PATH)/../../tesseract
LEPTONICA_PATH := $(LOCAL_PATH)/../../leptonica
LIBJPEG_PATH := $(LOCAL_PATH)/libjpeg
LIBPNG_PATH := $(LOCAL_PATH)/libpng

# Just build the Android.mk files in the subdirs
include $(call all-subdir-makefiles)

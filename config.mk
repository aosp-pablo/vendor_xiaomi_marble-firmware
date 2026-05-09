#
# Copyright (C) 2025 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_DEVICE),marble)

FIRMWARE_PATH := vendor/xiaomi/marble-firmware
FIRMWARE_IMAGES := $(notdir $(wildcard $(FIRMWARE_PATH)/images/*.img))

$(foreach f, $(FIRMWARE_IMAGES), \
    $(eval AB_OTA_PARTITIONS += $(basename $(f))) \
    $(eval BOARD_CUSTOMIMAGES_PARTITION_LIST += $(basename $(f))) \
    $(eval BOARD_$(call to-upper,$(basename $(f)))_IMAGE_LIST := $(FIRMWARE_PATH)/images/$(f)))

$(warning "Including firmware images")

endif

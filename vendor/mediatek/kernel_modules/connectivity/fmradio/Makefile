# SPDX-License-Identifier: GPL-2.0
# Copyright (c) 2021 Mediatek Inc.
#
# Where this repository is checked out; MediaTek's own build has it at
# vendor/mediatek/kernel_modules next to the output directory.
MTK_KERNEL_MODULES_PATH ?= $(OUT_DIR)/../vendor/mediatek/kernel_modules
# Where the build put this repository's modules (their Module.symvers):
# the checkout itself, unless the external modules are built elsewhere.
MTK_KERNEL_MODULES_OUT ?= $(MTK_KERNEL_MODULES_PATH)

include $(wildcard $(KERNEL_SRC)/$(DEVICE_MODULES_REL_DIR)/Makefile.include)

EXTRA_SYMBOLS += $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers
# conninfra is not built for CONNAC 1.x chips (MT6833, MT6768 ...)
EXTRA_SYMBOLS += $(wildcard $(MTK_KERNEL_MODULES_OUT)/connectivity/conninfra/Module.symvers)

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)" $(@)

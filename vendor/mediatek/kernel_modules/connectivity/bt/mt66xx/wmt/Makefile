# Where this repository is checked out; MediaTek's own build has it at
# vendor/mediatek/kernel_modules next to the output directory.
MTK_KERNEL_MODULES_PATH ?= $(OUT_DIR)/../vendor/mediatek/kernel_modules
# Where the build put this repository's modules (their Module.symvers):
# the checkout itself, unless the external modules are built elsewhere.
MTK_KERNEL_MODULES_OUT ?= $(MTK_KERNEL_MODULES_PATH)

$(info [bt_drv] wmt/makefile start)


LOG_TAG := [BT_Drv][wmt]
ifneq ($(wildcard $(KERNEL_SRC)/$(DEVICE_MODULES_REL_DIR)/Makefile.include),)
include $(KERNEL_SRC)/$(DEVICE_MODULES_REL_DIR)/Makefile.include
extra_symbols := $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)
else
extra_symbols := $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)
endif


all: PRIVATE_LOG_TAG := $(LOG_TAG)
all: EXTRA_SYMBOLS += $(extra_symbols)
all:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS) BT_PLATFORM=connac1x LOG_TAG=$(PRIVATE_LOG_TAG) KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)"

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean

$(info [bt_drv] wmt/makefile end)

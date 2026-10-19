# Where this repository is checked out; MediaTek's own build has it at
# vendor/mediatek/kernel_modules next to the output directory.
MTK_KERNEL_MODULES_PATH ?= $(O)/../vendor/mediatek/kernel_modules
# Where the build put this repository's modules (their Module.symvers):
# the checkout itself, unless the external modules are built elsewhere.
MTK_KERNEL_MODULES_OUT ?= $(MTK_KERNEL_MODULES_PATH)

extra_symbols := $(abspath $(MTK_KERNEL_MODULES_OUT)/met_drv_v3/Module.symvers)
ifneq (,$(wildcard ../../../met_drv_secure_v3))
	extra_symbols += $(abspath $(MTK_KERNEL_MODULES_OUT)/met_drv_secure_v3/Module.symvers)
endif

all: PRIVATE_SYMBOLS := $(extra_symbols)
all:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(PRIVATE_SYMBOLS)"

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean

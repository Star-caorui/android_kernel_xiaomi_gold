# Where this repository is checked out; MediaTek's own build has it at
# vendor/mediatek/kernel_modules next to the output directory.
MTK_KERNEL_MODULES_PATH ?= $(O)/../vendor/mediatek/kernel_modules
# Where the build put this repository's modules (their Module.symvers):
# the checkout itself, unless the external modules are built elsewhere.
MTK_KERNEL_MODULES_OUT ?= $(MTK_KERNEL_MODULES_PATH)

extra_symbols := $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/conninfra/Module.symvers)
extra_symbols += $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)

$(info [wlan] WLAN_BUILD_COMMON=$(WLAN_BUILD_COMMON))

all:
ifdef WLAN_BUILD_COMMON
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(extra_symbols)"
else

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)) ,)
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac1x modules $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(extra_symbols)" CONNAC_VER=1_0 MODULE_NAME=wmt_chrdev_wifi
endif

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/conninfra/Module.symvers)) ,)
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac2x modules $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(extra_symbols)" CONNAC_VER=2_0 MODULE_NAME=wmt_chrdev_wifi_connac2
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac3x modules $(KBUILD_OPTIONS) KBUILD_EXTRA_SYMBOLS="$(extra_symbols)" CONNAC_VER=3_0 MODULE_NAME=wmt_chrdev_wifi_connac3
endif

endif

modules_install:
ifdef WLAN_BUILD_COMMON
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install
else

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)) ,)
	$(MAKE) M=$(M)/build/connac1x -C $(KERNEL_SRC) modules_install
endif

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/conninfra/Module.symvers)) ,)
	$(MAKE) M=$(M)/build/connac2x -C $(KERNEL_SRC) modules_install
	$(MAKE) M=$(M)/build/connac3x -C $(KERNEL_SRC) modules_install
endif

endif

clean:
ifdef WLAN_BUILD_COMMON
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
else

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/common/Module.symvers)) ,)
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac1x clean
endif

ifneq ($(wildcard $(abspath $(MTK_KERNEL_MODULES_OUT)/connectivity/conninfra/Module.symvers)) ,)
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac2x clean
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/build/connac3x clean
endif

endif

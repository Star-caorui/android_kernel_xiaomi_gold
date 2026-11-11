# gold's kernel, prebuilt

The kernel of the Redmi Note 13 5G (`gold`) for LineageOS, built by this repository's
[Release workflow](https://github.com/Star-caorui/android_kernel_xiaomi_gold/actions/workflows/release.yml) from
the `lineage-24.0` branch. The files are what LineageOS's `build_kernel` copies into `TARGET_KERNEL_DIR`, laid out
the same way, so a device tree that reads them from there takes them as they are instead of building a kernel.

| Here | What |
| --- | --- |
| `Image.gz` | the kernel image: Google's GKI build, unchanged |
| `boot.img` | the GKI build's certified boot image, unchanged: that kernel and Google's GKI certificate, for the device tree's `BOARD_PREBUILT_BOOTIMAGE`, which Android's build puts the device's AVB footer on |
| `mt6833.dtb` | gold's device tree blob, for `vendor_boot` |
| `dtbo.img` | its overlay, the `dtbo` partition |
| `kernel-uapi-headers.tar.gz` | the GKI build's uapi headers and MediaTek's, for userspace that includes them |
| `system_dlkm.modules.load` | the GKI modules `system_dlkm` loads, in order, as the GKI build lists them; those `.ko` are Google's, signed, unchanged |
| the other `.ko` | the modules MediaTek's build makes, without their debug sections |
| `manifest.xml` | every source and tool the build used, at the commit it used |

Which of the modules go into `vendor_boot` and `vendor_dlkm`, and in what order they load, is the device tree's to
say. Android's build strips such modules when it installs them; they are stripped here already, which changes
nothing it installs. A rebuild from the same sources gives them with their debug sections.

Each commit is one build; its message and its `kernel-<date><number>` tag say which commit of `lineage-24.0` and
which GKI build it is. To build the same from source, sync `manifest.xml` with `repo` and run
`build_mgk_64_k66.sh` with that GKI build, as the workflow does.

In a LineageOS tree, a local manifest syncs one tag of this branch, and the device tree's `TARGET_KERNEL_DIR` names
where:

```xml
<project path="device/xiaomi/gold-kernel" name="Star-caorui/android_kernel_xiaomi_gold" remote="github"
         revision="refs/tags/kernel-2026111201" clone-depth="1" />
```

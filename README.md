# gold's kernel modules

The vendor kernel modules of the Redmi Note 13 5G (`gold`), each in the directory stock's kernel source tree
gives it:

| Path | What |
| --- | --- |
| `kernel_device_modules-6.6` | MediaTek's device modules, gold's device tree blob and overlay |
| `vendor/mediatek/kernel_modules` | MediaTek's other modules (connectivity, GPU, …) |
| `vendor/huaqin/kernel_modules` | Huaqin's drivers |

| Branch | What |
| --- | --- |
| `OS3.0.5.0.VNQMIXM` | the sources of stock's modules of firmware OS3.0.5.0.VNQMIXM |
| `lineage-24.0` | what LineageOS builds: that, built with Kleaf, with LineageOS's changes on top |
| `release` | `lineage-24.0` built, laid out as `build_kernel` lays it out, for a device tree to take as prebuilt kernel; one commit and one `kernel-<date><number>` tag per build |

[android_kernel_xiaomi_gold_manifest](https://github.com/Star-caorui/android_kernel_xiaomi_gold_manifest) syncs
`lineage-24.0` with the kernel and the tools for LineageOS's build. On `OS3.0.5.0.VNQMIXM`,
[`verify/`](https://github.com/Star-caorui/android_kernel_xiaomi_gold/tree/OS3.0.5.0.VNQMIXM/verify) builds the modules and compares them with stock's on its own: its README says how, and
`results.md` what came out.

The [Release workflow](https://github.com/Star-caorui/android_kernel_xiaomi_gold/actions/workflows/release.yml),
started by hand on `lineage-24.0`, builds the kernel with the kernel manifest, on the GKI build it names, and commits
it to `release` with a tag: the files LineageOS's `build_kernel` copies into a device tree's `TARGET_KERNEL_DIR`, laid
out the same, so a device tree can take them instead of building a kernel. `.github/release/README.md` is the
`release` branch's README, which says what each file is.

The two MediaTek directories start from MiCode's published commits; each directory's own README says what was done
to it. Until 2026-11-11 the directories were four repositories, `android_kernel_xiaomi_gold-modules`,
`-mediatek_modules`, `-huaqin_modules` and `-xiaomi_modules`; their history is kept here, each moved into its
directory.
